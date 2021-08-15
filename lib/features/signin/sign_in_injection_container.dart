import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_beta/features/signin/data/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/utils/input_converter.dart';

import '../../core/network/network_info.dart';

Future<void> signInDependenciesInjection(GetIt sl) async {
  //! Features - Sign In
  // Bloc
  sl.registerFactory(() => SignInBloc(sl(), sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInCheckIfEmailIsInUse(sl(), sl()));
  sl.registerLazySingleton(() => SignInWithEmailAndPassword(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));

  // Repository
  sl.registerLazySingleton<ISignInRepository>(
    () => SignInRepository(sl(), sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<ISignInRemoteSource>(
    () => SignInRemoteSource(sl(), sl()),
  );

  sl.registerLazySingleton<ISignInLocalSource>(
    () => SignInLocalSource(sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
