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
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/injection_container.dart';

class SignInServiceLocator {
  Future<void> pushNewScope() async {
    Logger.serviceLocator(
        'SignInServiceLocator -> pushNewScope: SignInGetItScope');
    getIt.pushNewScope(scopeName: 'SignInGetItScope');
    await _signInDependencies();
  }

  Future<void> popScope() async {
    Logger.serviceLocator('SignInServiceLocator -> popScope: SignInGetItScope');
    getIt.popScopesTill('SignInGetItScope');
  }

  static T get<T extends Object>() {
    Logger.serviceLocator('SignInServiceLocator -> get: $T');
    return getIt<T>();
  }

  /// https://github.com/fluttercommunity/get_it/issues/109
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

    getIt.registerLazySingleton<NavigationCubit>(
      () => NavigationCubit(),
    );

    getIt.registerFactory<SignInOptionsBloc>(
      () => SignInOptionsBloc(
        getIt<AuthBloc>(),
        getIt<NavigationCubit>(),
        getIt<SignInWithGoogle>(),
      ),
    );

    getIt.registerFactory<SignInCredentialBloc>(
      () => SignInCredentialBloc(
        getIt<SignInCredentialCheck>(),
        getIt<NavigationCubit>(),
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
        getIt<NavigationCubit>(),
        getIt<SignInWithSecret>(),
      ),
    );

    getIt.registerFactory<SignInSecretResetBloc>(
      () => SignInSecretResetBloc(
        getIt<SignInSecretReset>(),
        getIt<NavigationCubit>(),
      ),
    );

    //********************************** */
  }
}
