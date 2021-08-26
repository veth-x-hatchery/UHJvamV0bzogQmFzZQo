import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/service_locator.dart';

/// Will be responsible for the entire sign in feature dependencies.
/// Need to be initialized and disposed by the feature root page.
abstract class ISignInServiceLocator {
  Future<void> init();
  Future<void> dispose();
  T get<T extends Object>();
}

class SignInServiceLocator implements ISignInServiceLocator {
  @override
  Future<void> init() async {
    Logger.serviceLocator(
        'SignInServiceLocator -> pushNewScope: SignInGetItScope');
    getIt.pushNewScope(scopeName: 'SignInGetItScope');
    await _signInDependencies();
  }

  @override
  Future<void> dispose() async {
    Logger.serviceLocator('SignInServiceLocator -> popScope: SignInGetItScope');
    getIt.popScopesTill('SignInGetItScope');
  }

  @override
  T get<T extends Object>() {
    Logger.serviceLocator('SignInServiceLocator -> get: $T');
    return getIt<T>();
  }

  Future<void> _signInDependencies() async {
    // Data sources

    getIt.registerLazySingleton<ISignInLocalSource>(
      () => SignInLocalSource(getIt<SharedPreferences>()),
    );

    // Repository
    getIt.registerLazySingleton<ISignInRepository>(
      () => SignInRepository(
        // sl<ISignInRemoteSource>(),
        getIt<ISignInLocalSource>(),
        getIt<INetworkInfo>(),
      ),
    );

    // Use cases

    getIt.registerLazySingleton<SignInCredentialCheck>(
      () => SignInCredentialCheck(
        getIt<ISignInRepository>(),
        getIt<IAuthFacade>(),
      ),
    );

    getIt.registerLazySingleton<SignInWithSecret>(
      () => SignInWithSecret(
        getIt<ISignInRepository>(),
        getIt<IAuthFacade>(),
      ),
    );

    getIt.registerLazySingleton<SignInSecretReset>(
      () => SignInSecretReset(
        getIt<ISignInRepository>(),
        getIt<IAuthFacade>(),
      ),
    );

    getIt.registerLazySingleton<SignInWithGoogle>(
      () => SignInWithGoogle(
        // sl<ISignInRepository>(),
        getIt<IAuthFacade>(),
      ),
    );

    getIt.registerLazySingleton<SignInRegisterCredentialAndSecret>(
      () => SignInRegisterCredentialAndSecret(
        // sl<ISignInRepository>(),
        getIt<IAuthFacade>(),
      ),
    );

    // BLoC

    getIt.registerLazySingleton<NavigationManager>(
      () => NavigationManager(),
    );

    getIt.registerFactory<SignInOptionsBloc>(
      () => SignInOptionsBloc(
        getIt<AuthBloc>(),
        getIt<NavigationManager>(),
        getIt<SignInWithGoogle>(),
      ),
    );

    getIt.registerFactory<SignInCredentialBloc>(
      () => SignInCredentialBloc(
        getIt<SignInCredentialCheck>(),
        getIt<NavigationManager>(),
      ),
    );

    getIt.registerFactory<SignInRegisterBloc>(
      () => SignInRegisterBloc(
        getIt<AuthBloc>(),
        getIt<SignInRegisterCredentialAndSecret>(),
      ),
    );

    getIt.registerFactory<SignInSecretBloc>(
      () => SignInSecretBloc(
        getIt<AuthBloc>(),
        getIt<NavigationManager>(),
        getIt<SignInWithSecret>(),
      ),
    );

    getIt.registerFactory<SignInSecretResetBloc>(
      () => SignInSecretResetBloc(
        getIt<SignInSecretReset>(),
        getIt<NavigationManager>(),
      ),
    );
  }
}
