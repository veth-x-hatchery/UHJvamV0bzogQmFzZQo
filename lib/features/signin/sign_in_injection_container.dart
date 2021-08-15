import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_beta/features/signin/data/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/auth/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/infrastructure/firebase_auth_facade.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';
import 'package:vethx_beta/features/signin/presentation/utils/input_converter.dart';

import '../../core/network/network_info.dart';

Future<void> signInDependenciesInjection(GetIt sl) async {
  //! External
  sl.registerLazySingleton(() async => SharedPreferences.getInstance());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton(() => CustomValidators());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));

  // Data sources

  sl.registerLazySingleton<ISignInRemoteSource>(
    () => SignInRemoteSource(sl<http.Client>(), sl<API>()),
  );

  sl.registerLazySingleton<ISignInLocalSource>(
    () => SignInLocalSource(sl()),
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
  sl.registerLazySingleton(() => SignInCheckIfEmailIsInUse(
        sl<CustomValidators>(),
        sl<ISignInRepository>(),
      ));

  sl.registerLazySingleton(() => SignInWithEmailAndPassword(
        sl<ISignInRepository>(),
      ));

  sl.registerLazySingleton(() => SignInWithGoogle(
        sl<ISignInRepository>(),
      ));

  // Bloc
  sl.registerFactory(() => SignInBloc(
        sl<SignInCheckIfEmailIsInUse>(),
        sl<SignInWithEmailAndPassword>(),
        sl<SignInWithGoogle>(),
      ));

  //********************************** */

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn());

  sl.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        sl<FirebaseAuth>(),
        sl<GoogleSignIn>(),
      ));

  sl.registerFactory<SignInFormBloc>(() => SignInFormBloc(
        sl<IAuthFacade>(),
      ));
}
