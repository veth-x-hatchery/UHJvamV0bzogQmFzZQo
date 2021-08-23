import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';

import 'sign_in_service_locator.mock.mocks.dart';

class MockISignInServiceLocator implements ISignInServiceLocator {
  late MockSignInOptionsBloc mockSignInBloc;
  late MockSignInCredentialBloc mockMockSignInCredentialBloc;
  late MockSignInRegisterBloc mockMockSignInRegisterBloc;
  late MockSignInSecretBloc mockMockSignInSecretBloc;
  late MockSignInSecretResetBloc mockSignInSecretResetBloc;
  late NavigationCubit mockNavigationCubit;

  final GetIt getIt;

  final Future<void> Function()? initOverride;
  final Future<void> Function()? disposeOverride;

  MockISignInServiceLocator({
    required this.getIt,
    this.initOverride,
    this.disposeOverride,
  }) {
    mockSignInBloc = MockSignInOptionsBloc();
    mockMockSignInSecretBloc = MockSignInSecretBloc();
    mockMockSignInCredentialBloc = MockSignInCredentialBloc();
    mockMockSignInRegisterBloc = MockSignInRegisterBloc();
    mockSignInSecretResetBloc = MockSignInSecretResetBloc();
    mockNavigationCubit = NavigationCubit();
  }

  @override
  T get<T extends Object>() {
    Logger.serviceLocator('MockISignInServiceLocator -> get: $T');
    return getIt.get<T>();
  }

  @override
  Future<void> init() async {
    getIt.pushNewScope();

    getIt.registerFactory<SignInOptionsBloc>(
      () => mockSignInBloc,
    );
    getIt.registerFactory<SignInCredentialBloc>(
      () => mockMockSignInCredentialBloc,
    );
    getIt.registerFactory<SignInRegisterBloc>(
      () => mockMockSignInRegisterBloc,
    );
    getIt.registerFactory<SignInSecretBloc>(
      () => mockMockSignInSecretBloc,
    );
    getIt.registerFactory<SignInSecretResetBloc>(
      () => mockSignInSecretResetBloc,
    );
    getIt.registerLazySingleton<NavigationCubit>(
      () => mockNavigationCubit,
    );

    Logger.serviceLocator('MockISignInServiceLocator -> pushNewScope');
  }

  @override
  Future<void> dispose() {
    getIt.popScope();

    Logger.serviceLocator('MockISignInServiceLocator -> popScope');

    return Future.value();
  }
}

@GenerateMocks([
  SignInOptionsBloc,
  SignInCredentialBloc,
  SignInRegisterBloc,
  SignInSecretBloc,
  SignInSecretResetBloc,
  NavigationCubit,
])
void main() {}
