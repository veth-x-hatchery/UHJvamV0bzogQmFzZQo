import 'package:get_it/get_it.dart';
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
  GetIt get _getIt => ServiceLocatorConfig.getIt;

  @override
  Future<void> init() async {
    Logger.serviceLocator(
        'SignInServiceLocator -> pushNewScope: SignInGetItScope');
    _getIt.pushNewScope(scopeName: 'SignInGetItScope');
    await _signInDependencies();
  }

  @override
  Future<void> dispose() async {
    Logger.serviceLocator('SignInServiceLocator -> popScope: SignInGetItScope');
    _getIt.popScopesTill('SignInGetItScope');
  }

  @override
  T get<T extends Object>() {
    Logger.serviceLocator('SignInServiceLocator -> get: $T');
    return _getIt<T>();
  }

  Future<void> _signInDependencies() async {
    // Data sources

    _getIt.registerLazySingleton<ISignInLocalSource>(
      () => SignInLocalSource(
          _getIt<ILocalStorage<PersonallyIdentifiableInformationKeys>>()),
    );

    // Repository
    _getIt.registerLazySingleton<ISignInRepository>(
      () => SignInRepository(
        // sl<ISignInRemoteSource>(),
        _getIt<ISignInLocalSource>(),
        _getIt<INetworkInfo>(),
      ),
    );

    // Use cases

    _getIt.registerLazySingleton<SignInCredentialCheck>(
      () => SignInCredentialCheck(
        _getIt<ISignInRepository>(),
        _getIt<IAuthFacade>(),
      ),
    );

    _getIt.registerLazySingleton<SignInWithSecret>(
      () => SignInWithSecret(
        _getIt<ISignInRepository>(),
        _getIt<IAuthFacade>(),
      ),
    );

    _getIt.registerLazySingleton<SignInSecretReset>(
      () => SignInSecretReset(
        _getIt<ISignInRepository>(),
        _getIt<IAuthFacade>(),
      ),
    );

    _getIt.registerLazySingleton<SignInWithGoogle>(
      () => SignInWithGoogle(
        // sl<ISignInRepository>(),
        _getIt<IAuthFacade>(),
      ),
    );

    _getIt.registerLazySingleton<SignInRegisterCredentialAndSecret>(
      () => SignInRegisterCredentialAndSecret(
        // sl<ISignInRepository>(),
        _getIt<IAuthFacade>(),
      ),
    );

    // BLoC

    _getIt.registerLazySingleton<NavigationManager>(
      () => NavigationManager(),
    );

    _getIt.registerFactory<SignInOptionsBloc>(
      () => SignInOptionsBloc(
        _getIt<AuthBloc>(),
        _getIt<NavigationManager>(),
        _getIt<SignInWithGoogle>(),
      ),
    );

    _getIt.registerFactory<SignInCredentialBloc>(
      () => SignInCredentialBloc(
        _getIt<SignInCredentialCheck>(),
        _getIt<NavigationManager>(),
      ),
    );

    _getIt.registerFactory<SignInRegisterBloc>(
      () => SignInRegisterBloc(
        _getIt<AuthBloc>(),
        _getIt<SignInRegisterCredentialAndSecret>(),
      ),
    );

    _getIt.registerFactory<SignInSecretBloc>(
      () => SignInSecretBloc(
        _getIt<AuthBloc>(),
        _getIt<NavigationManager>(),
        _getIt<SignInWithSecret>(),
      ),
    );

    _getIt.registerFactory<SignInSecretResetBloc>(
      () => SignInSecretResetBloc(
        _getIt<SignInSecretReset>(),
        _getIt<NavigationManager>(),
      ),
    );
  }
}
