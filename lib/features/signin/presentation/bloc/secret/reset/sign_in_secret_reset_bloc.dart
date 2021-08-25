import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_secret_reset_event.dart';
part 'sign_in_secret_reset_state.dart';
part 'sign_in_secret_reset_bloc.freezed.dart';

class SignInSecretResetBloc
    extends Bloc<SignInSecretResetEvent, SignInSecretResetState> {
  SignInSecretResetBloc(
    this._useCase,
    this._navigation,
  ) : super(SignInSecretResetState.initial());

  final SignInSecretReset _useCase;
  final NavigationManager _navigation;

  @override
  Stream<SignInSecretResetState> mapEventToState(
    SignInSecretResetEvent event,
  ) async* {
    yield* event.map(
      secretResetRequest: (e) async* {
        yield SignInSecretResetState(
          isLoading: true,
          notification: none(),
        );
        final result = await _useCase.call(const NoParams());
        yield SignInSecretResetState(
            isLoading: false,
            notification: result.fold(
              (l) {
                if (l.failure == const AuthFailure.invalidCachedCredential()) {
                  _navigation.goTo(SignInPageGoTo.credentialPage(
                      from: SignInPageRoutes.secretEntry));
                }
                return optionOf(VethxNotification.snack(message: l.message));
              },
              (r) => optionOf(VethxNotification.snack(
                  message: SignInSecretResetMessages.success)),
            ));
      },
    );
  }
}
