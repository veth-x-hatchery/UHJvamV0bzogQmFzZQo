import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/api/api_setup.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/services/storage/pii.service.dart';
import 'package:vethx_beta/core/utils/app_config.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authorization.usecase.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth.service.dart';
import 'package:vethx_beta/features/authentication/presentation/bloc/local_authentication_bloc.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_user_mapper.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';

// ignore: avoid_classes_with_only_static_members
class ServiceLocatorConfig {
  static final ServiceLocatorConfig _singleton =
      ServiceLocatorConfig._internal();

  factory ServiceLocatorConfig() {
    return _singleton;
  }

  ServiceLocatorConfig._internal();

  static final GetIt getIt = GetIt.instance;

  // static T get<T extends Object>() {
  //   Logger.serviceLocator('ServiceLocatorConfig -> get: $T');
  //   return getIt<T>();
  // }

  static Future<void> init() async {
    //! External

    // final sharedPreferences = await SharedPreferences.getInstance();

    // getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    getIt.registerLazySingleton<AppConfig>(() => AppConfig());

    getIt.registerLazySingleton<
        ILocalStorage<PersonallyIdentifiableInformationKeys>>(
      () => PII(const FlutterSecureStorage()),
    );

    getIt.registerLazySingleton(() => http.Client());

    getIt.registerLazySingleton(() => InternetConnectionChecker());

    getIt.registerLazySingleton(() => FirebaseAuth.instance);

    getIt.registerLazySingleton(() => GoogleSignIn());

    //! Core

    getIt.registerLazySingleton<INetworkInfo>(
        () => NetworkInfo(getIt<InternetConnectionChecker>()));

    getIt.registerLazySingleton<IApiSetup>(() => ApiSetupProduction());

    getIt.registerLazySingleton<API>(() => API(getIt<IApiSetup>()));

    // Services

    getIt.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());

    getIt.registerLazySingleton<IAuthFacade>(
      () => AuthFacadeMock()..setupSignInEmailIntegrationTest(),
    );

    getIt.registerLazySingleton<LocalAuthentication>(
      () => LocalAuthentication(),
    );

    getIt.registerLazySingleton<ILocalAuth>(
      () => LocalAuth(getIt<LocalAuthentication>()),
    );
    // getIt.registerLazySingleton<IAuthFacade>(
    //   () => FirebaseAuthFacade(
    //     getIt<FirebaseAuth>(),
    //     getIt<GoogleSignIn>(),
    //     getIt<FirebaseUserMapper>(),
    //   ),
    // );

    //! Use case

    getIt.registerLazySingleton<RequestLocalAuthorization>(
      () => RequestLocalAuthorization(getIt<ILocalAuth>()),
    );

    // BLoC

    getIt.registerLazySingleton<LocalAuthenticationBloc>(
      () => LocalAuthenticationBloc(getIt<RequestLocalAuthorization>()),
    );

    getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        getIt<IAuthFacade>(),
      ),
    );

    // Features Service Locators

    getIt.registerFactory<ISignInServiceLocator>(
      () => SignInServiceLocator(),
    );
  }
}
