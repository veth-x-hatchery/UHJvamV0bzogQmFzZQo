import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_credential_event.dart';
part 'sign_in_credential_state.dart';
part 'sign_in_credential_bloc.freezed.dart';

class SignInCredentialBloc
    extends Bloc<SignInCredentialEvent, SignInCredentialState> {
  final SignInCredentialCheck _credentialCheck;
  final NavigationManager _navigation;

  SignInCredentialBloc(
    this._credentialCheck,
    this._navigation,
  ) : super(SignInCredentialState.initial());

  @override
  Stream<SignInCredentialState> mapEventToState(
    SignInCredentialEvent event,
  ) async* {
    yield* event.map(
      credentialChanged: (e) async* {
        yield state.copyWith(
          credential: Credential(e.credentialStr),
          authFailureOrSuccessOption: none(),
          notification: none(),
        );
      },
      analyseCredentialPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
          notification: none(),
        );
        final result = await _credentialCheck.call(state.credential);
        yield state.copyWith(
          isLoading: false,
          notification: result.fold(
            (l) => optionOf(VethxNotification.snack(message: l.message)),
            (r) => none(),
          ),
          authFailureOrSuccessOption: result.fold(
            (l) => optionOf(left(l)), // Todo(v): Simplify it
            (isAlreadyInUse) {
              _navigation.goTo(isAlreadyInUse
                  ? SignInPageGoTo.secretPage(
                      from: SignInPageRoutes.credentialEntry)
                  : SignInPageGoTo.registerPage(
                      credential: state.credential,
                      from: SignInPageRoutes.credentialEntry));
              return none();
            },
          ),
        );
      },
    );
  }
}
