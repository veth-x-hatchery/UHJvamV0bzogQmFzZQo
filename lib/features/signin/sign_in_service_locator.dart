import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/core/services/i_local_storage.service.dart';
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
    ServiceLocatorConfig.getIt.pushNewScope(scopeName: 'SignInGetItScope');
    await _signInDependencies();
  }

  @override
  Future<void> dispose() async {
    Logger.serviceLocator('SignInServiceLocator -> popScope: SignInGetItScope');
    ServiceLocatorConfig.getIt.popScopesTill('SignInGetItScope');
  }

  @override
  T get<T extends Object>() {
    Logger.serviceLocator('SignInServiceLocator -> get: $T');
    return ServiceLocatorConfig.getIt<T>();
  }

  Future<void> _signInDependencies() async {
    // Data sources

    ServiceLocatorConfig.getIt.registerLazySingleton<ISignInLocalSource>(
      () => SignInLocalSource(ServiceLocatorConfig.getIt<
          ILocalStorage<PersonallyIdentifiableInformationKeys>>()),
    );

    // Repository
    ServiceLocatorConfig.getIt.registerLazySingleton<ISignInRepository>(
      () => SignInRepository(
        // sl<ISignInRemoteSource>(),
        ServiceLocatorConfig.getIt<ISignInLocalSource>(),
        ServiceLocatorConfig.getIt<INetworkInfo>(),
      ),
    );

    // Use cases

    ServiceLocatorConfig.getIt.registerLazySingleton<SignInCredentialCheck>(
      () => SignInCredentialCheck(
        ServiceLocatorConfig.getIt<ISignInRepository>(),
        ServiceLocatorConfig.getIt<IAuthFacade>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerLazySingleton<SignInWithSecret>(
      () => SignInWithSecret(
        ServiceLocatorConfig.getIt<ISignInRepository>(),
        ServiceLocatorConfig.getIt<IAuthFacade>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerLazySingleton<SignInSecretReset>(
      () => SignInSecretReset(
        ServiceLocatorConfig.getIt<ISignInRepository>(),
        ServiceLocatorConfig.getIt<IAuthFacade>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerLazySingleton<SignInWithGoogle>(
      () => SignInWithGoogle(
        // sl<ISignInRepository>(),
        ServiceLocatorConfig.getIt<IAuthFacade>(),
      ),
    );

    ServiceLocatorConfig.getIt
        .registerLazySingleton<SignInRegisterCredentialAndSecret>(
      () => SignInRegisterCredentialAndSecret(
        // sl<ISignInRepository>(),
        ServiceLocatorConfig.getIt<IAuthFacade>(),
      ),
    );

    // BLoC

    ServiceLocatorConfig.getIt.registerLazySingleton<NavigationManager>(
      () => NavigationManager(),
    );

    ServiceLocatorConfig.getIt.registerFactory<SignInOptionsBloc>(
      () => SignInOptionsBloc(
        ServiceLocatorConfig.getIt<AuthBloc>(),
        ServiceLocatorConfig.getIt<NavigationManager>(),
        ServiceLocatorConfig.getIt<SignInWithGoogle>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerFactory<SignInCredentialBloc>(
      () => SignInCredentialBloc(
        ServiceLocatorConfig.getIt<SignInCredentialCheck>(),
        ServiceLocatorConfig.getIt<NavigationManager>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerFactory<SignInRegisterBloc>(
      () => SignInRegisterBloc(
        ServiceLocatorConfig.getIt<AuthBloc>(),
        ServiceLocatorConfig.getIt<SignInRegisterCredentialAndSecret>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerFactory<SignInSecretBloc>(
      () => SignInSecretBloc(
        ServiceLocatorConfig.getIt<AuthBloc>(),
        ServiceLocatorConfig.getIt<NavigationManager>(),
        ServiceLocatorConfig.getIt<SignInWithSecret>(),
      ),
    );

    ServiceLocatorConfig.getIt.registerFactory<SignInSecretResetBloc>(
      () => SignInSecretResetBloc(
        ServiceLocatorConfig.getIt<SignInSecretReset>(),
        ServiceLocatorConfig.getIt<NavigationManager>(),
      ),
    );
  }
}
