import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/api/api_setup.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_user_mapper.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/injection_container.dart';

Future<void> signInDependenciesInjection() async {
  //! External

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => FirebaseAuth.instance);

  sl.registerLazySingleton(() => GoogleSignIn());

  //! Core

  sl.registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(sl<InternetConnectionChecker>()));

  sl.registerLazySingleton<IApiSetup>(() => ApiSetupProduction());

  sl.registerLazySingleton<API>(() => API(sl<IApiSetup>()));

  // Services

  sl.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());

  sl.registerLazySingleton<IAuthFacade>(
    () => FirebaseAuthFacade(
      sl<FirebaseAuth>(),
      sl<GoogleSignIn>(),
      sl<FirebaseUserMapper>(),
    ),
  );

  // Data sources

  // sl.registerLazySingleton<ISignInRemoteSource>(
  //   () => SignInRemoteSource(
  //     sl<http.Client>(),
  //     sl<API>(),
  //   ),
  // );

  sl.registerLazySingleton<ISignInLocalSource>(
    () => SignInLocalSource(sl<SharedPreferences>()),
  );

  // Repository
  sl.registerLazySingleton<ISignInRepository>(
    () => SignInRepository(
      // sl<ISignInRemoteSource>(),
      sl<ISignInLocalSource>(),
      sl<INetworkInfo>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<SignInCredentialCheck>(
    () => SignInCredentialCheck(
      sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  sl.registerLazySingleton<SignInWithSecret>(
    () => SignInWithSecret(
      sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  sl.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(
      // sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  sl.registerLazySingleton<SignInRegisterCredentialAndSecret>(
    () => SignInRegisterCredentialAndSecret(
      // sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  // Bloc
  sl.registerLazySingleton<NavigationCubit>(
    () => NavigationCubit(),
  );

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(sl<IAuthFacade>()),
  );

  sl.registerFactory<SignInCredentialBloc>(
    () => SignInCredentialBloc(
      sl<SignInCredentialCheck>(),
      sl<NavigationCubit>(),
    ),
  );

  sl.registerFactory<SignInRegisterBloc>(
    () => SignInRegisterBloc(
      sl<AuthBloc>(),
      sl<SignInRegisterCredentialAndSecret>(),
    ),
  );

  sl.registerFactory<SignInSecretBloc>(
    () => SignInSecretBloc(
      sl<AuthBloc>(),
      sl<NavigationCubit>(),
      sl<SignInWithSecret>(),
    ),
  );

  sl.registerFactory<SignInOptionsBloc>(
    () => SignInOptionsBloc(
      sl<AuthBloc>(),
      sl<NavigationCubit>(),
      sl<SignInWithGoogle>(),
    ),
  );

  //********************************** */
}
