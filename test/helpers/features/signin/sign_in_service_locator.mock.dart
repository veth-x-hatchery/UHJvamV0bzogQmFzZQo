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
  late MockSignInCredentialBloc mockSignInCredentialBloc;
  late MockSignInRegisterBloc mockSignInRegisterBloc;
  late MockSignInSecretBloc mockSignInSecretBloc;
  late MockSignInSecretResetBloc mockSignInSecretResetBloc;
  late MockNavigationCubit mockNavigationCubit;

  final GetIt getIt;

  /// In some test cases we can need to use .GoTo funcionality
  final bool useNavigationMock;
  late NavigationCubit navigationCubit;

  MockISignInServiceLocator({
    required this.getIt,
    this.useNavigationMock = true,
  }) {
    mockSignInBloc = MockSignInOptionsBloc();
    mockSignInSecretBloc = MockSignInSecretBloc();
    mockSignInCredentialBloc = MockSignInCredentialBloc();
    mockSignInRegisterBloc = MockSignInRegisterBloc();
    mockSignInSecretResetBloc = MockSignInSecretResetBloc();
    mockNavigationCubit = MockNavigationCubit();
    navigationCubit = NavigationCubit();
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
      () => mockSignInCredentialBloc,
    );
    getIt.registerFactory<SignInRegisterBloc>(
      () => mockSignInRegisterBloc,
    );
    getIt.registerFactory<SignInSecretBloc>(
      () => mockSignInSecretBloc,
    );
    getIt.registerFactory<SignInSecretResetBloc>(
      () => mockSignInSecretResetBloc,
    );
    getIt.registerLazySingleton<NavigationCubit>(
      () => useNavigationMock ? mockNavigationCubit : navigationCubit,
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
