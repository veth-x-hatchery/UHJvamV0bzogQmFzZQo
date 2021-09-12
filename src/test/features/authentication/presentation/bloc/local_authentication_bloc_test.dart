import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/authentication/domain/usecases/request_authentication.usecase.dart';
import 'package:hatchery/features/authentication/infrastructure/services/local_auth_failure.dart';
import 'package:hatchery/features/authentication/presentation/bloc/local_authentication_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_authentication_bloc_test.mocks.dart';

@GenerateMocks([
  RequestLocalAuthentication,
])
void main() {
  late MockRequestLocalAuthentication _mockRequestLocalAuthentication;
  late LocalAuthenticationBloc _bloc;
  //

  setUp(() {
    _mockRequestLocalAuthentication = MockRequestLocalAuthentication();
    _bloc = LocalAuthenticationBloc(_mockRequestLocalAuthentication);
  });

  test('when a failure occours then should emit corret values', () async {
    // arrange

    final failure = FailureDetails(
      message: RequestLocalAuthenticationErrorMessages.genericError(),
      failure: const LocalAuthFailure.genericError(),
    );

    when(_mockRequestLocalAuthentication.call(any))
        .thenAnswer((_) async => left(failure));

    final expected = [
      const LocalAuthenticationState.loading(),
      const LocalAuthenticationState.unauthorized(),
    ];

    // act

    _bloc.add(const LocalAuthenticationEvent.request());

    // assert

    await expectLater(_bloc.stream, emitsInOrder(expected));
  });

  test('when is unauthorized then should emit corret values', () async {
    // arrange

    when(_mockRequestLocalAuthentication.call(any))
        .thenAnswer((_) async => right(false));

    final expected = [
      const LocalAuthenticationState.loading(),
      const LocalAuthenticationState.unauthorized(),
    ];

    // act

    _bloc.add(const LocalAuthenticationEvent.request());

    // assert

    await expectLater(_bloc.stream, emitsInOrder(expected));
  });

  test('when is authorized then should emit corret values', () async {
    // arrange

    when(_mockRequestLocalAuthentication.call(any))
        .thenAnswer((_) async => right(true));

    final expected = [
      const LocalAuthenticationState.loading(),
      const LocalAuthenticationState.authorized(),
    ];

    // act

    _bloc.add(const LocalAuthenticationEvent.request());

    // assert

    await expectLater(_bloc.stream, emitsInOrder(expected));
  });
}
