import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/api/api_setup.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/utils/input_converter.dart';
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

  sl.registerLazySingleton(() => InputConverter());

  sl.registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(sl<InternetConnectionChecker>()));

  sl.registerLazySingleton<IApiSetup>(() => ApiSetupProduction());

  sl.registerLazySingleton<API>(() => API(sl<IApiSetup>()));

  // Services

  sl.registerLazySingleton<IAuthFacade>(
    () => FirebaseAuthFacade(
      sl<FirebaseAuth>(),
      sl<GoogleSignIn>(),
    ),
  );

  // Data sources

  sl.registerLazySingleton<ISignInRemoteSource>(
    () => SignInRemoteSource(
      sl<http.Client>(),
      sl<API>(),
    ),
  );

  sl.registerLazySingleton<ISignInLocalSource>(
    () => SignInLocalSource(sl<SharedPreferences>()),
  );

  // Repository
  sl.registerLazySingleton<ISignInRepository>(
    () => SignInRepository(
      sl<ISignInRemoteSource>(),
      sl<ISignInLocalSource>(),
      sl<INetworkInfo>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<SignInCheckIfEmailIsInUse>(
    () => SignInCheckIfEmailIsInUse(
      sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  sl.registerLazySingleton<SignInWithEmailAndPassword>(
    () => SignInWithEmailAndPassword(
      sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  sl.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(
      sl<ISignInRepository>(),
      sl<IAuthFacade>(),
    ),
  );

  // Bloc
  sl.registerFactory<SignInBloc>(
    () => SignInBloc(
      sl<SignInCheckIfEmailIsInUse>(),
      sl<SignInWithEmailAndPassword>(),
      sl<SignInWithGoogle>(),
    ),
  );

  //********************************** */
}
