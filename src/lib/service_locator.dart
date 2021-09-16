import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hatchery/core/api/api.dart';
import 'package:hatchery/core/api/api_setup.dart';
import 'package:hatchery/core/network/network_info.dart';
import 'package:hatchery/core/services/storage/cache.service.dart';
import 'package:hatchery/core/services/storage/i_local_storage.service.dart';
import 'package:hatchery/core/services/storage/pii.service.dart';
import 'package:hatchery/core/utils/app_config.dart';
import 'package:hatchery/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:hatchery/features/authentication/domain/usecases/request_authentication.usecase.dart';
import 'package:hatchery/features/authentication/infrastructure/services/local_auth.service.dart';
import 'package:hatchery/features/authentication/infrastructure/services/local_auth.service.mock.dart';
import 'package:hatchery/features/authentication/presentation/bloc/local_authentication_bloc.dart';
import 'package:hatchery/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_user_mapper.dart';
import 'package:hatchery/features/signin/sign_in_service_locator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:local_auth/local_auth.dart';

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

    final appConfig = AppConfig();
    await appConfig.fromEnvironment();
    getIt.registerLazySingleton<AppConfig>(() => appConfig);

    getIt.registerLazySingleton<
        ILocalStorage<PersonallyIdentifiableInformationKeys>>(
      () => PII(const FlutterSecureStorage()),
    );

    await Hive.initFlutter();
    getIt.registerLazySingleton<ILocalStorage<SensitiveDataKeys>>(
      () => CacheService(
        Hive,
        getIt<ILocalStorage<PersonallyIdentifiableInformationKeys>>(),
      ),
    );

    getIt.registerLazySingleton(() => http.Client());

    getIt.registerLazySingleton(() => InternetConnectionChecker());

    getIt.registerLazySingleton(() => FirebaseAuth.instance);

    getIt.registerLazySingleton(() => GoogleSignIn());

    getIt.registerLazySingleton<LocalAuthentication>(
      () => LocalAuthentication(),
    );

    //! Core

    getIt.registerLazySingleton<INetworkInfo>(
      () => NetworkInfo(getIt<InternetConnectionChecker>()),
    );

    getIt.registerLazySingleton<IApiSetup>(() => ApiSetupProduction());

    getIt.registerLazySingleton<API>(() => API(getIt<IApiSetup>()));

    // Data sources

    // Services

    if (getIt<AppConfig>().isIntegrationTest()) {
      // Firebase Auth Service

      getIt.registerLazySingleton<IAuthService>(
        () => AuthServiceMock()..setupSignInEmailIntegrationTest(),
      );

      // Local Authentication

      getIt.registerLazySingleton<ILocalAuth>(
        () => LocalAuthMock(),
      );
    } else {
      // Firebase Auth Service

      getIt.registerLazySingleton<FirebaseUserMapper>(
          () => FirebaseUserMapper());

      getIt.registerLazySingleton<IAuthService>(
        () => FirebaseAuthService(
          getIt<FirebaseAuth>(),
          getIt<GoogleSignIn>(),
          getIt<FirebaseUserMapper>(),
        ),
      );

      // Local Authentication

      getIt.registerLazySingleton<ILocalAuth>(
        () => LocalAuth(
          getIt<LocalAuthentication>(),
        ),
      );
    }

    //! Use case

    getIt.registerLazySingleton<RequestLocalAuthentication>(
      () => RequestLocalAuthentication(
        getIt<ILocalAuth>(),
        getIt<ILocalStorage<SensitiveDataKeys>>(),
      ),
    );

    // BLoC

    getIt.registerLazySingleton<LocalAuthenticationBloc>(
      () => LocalAuthenticationBloc(getIt<RequestLocalAuthentication>()),
    );

    getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        getIt<IAuthService>(),
      ),
    );

    // Features Service Locators

    getIt.registerFactory<ISignInServiceLocator>(
      () => SignInServiceLocator(),
    );
  }
}
