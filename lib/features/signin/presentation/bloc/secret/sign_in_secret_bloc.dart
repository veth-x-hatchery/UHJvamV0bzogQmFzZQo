import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_secret_event.dart';
part 'sign_in_secret_state.dart';
part 'sign_in_secret_bloc.freezed.dart';

class SignInSecretBloc extends Bloc<SignInSecretEvent, SignInSecretState> {
  final AuthBloc _authBloc;
  final NavigationManager _navigation;
  final SignInWithSecret _signInWithSecret;

  SignInSecretBloc(
    this._authBloc,
    this._navigation,
    this._signInWithSecret,
  ) : super(SignInSecretState.initial());

  @override
  Stream<SignInSecretState> mapEventToState(
    SignInSecretEvent event,
  ) async* {
    yield* event.map(
      secretChanged: (e) async* {
        yield state.copyWith(
          secret: Secret(e.secretStr),
          authFailureOrSuccessOption: none(),
          notification: none(),
        );
      },
      analyseSecretPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
          notification: none(),
        );
        final result =
            await _signInWithSecret.call(Params(secret: state.secret));
        yield state.copyWith(
          isLoading: false,
          notification: result.fold(
            (l) => optionOf(VethxNotification.snack(message: l.message)),
            (r) => none(),
          ),
          authFailureOrSuccessOption: result.fold(
            (l) {
              if (l.failure == const AuthFailure.invalidCachedCredential()) {
                _navigation.goTo(SignInPageGoTo.credentialPage(
                    from: SignInPageRoutes.secretEntry));
              }
              // Todo(v): Simplify it
              return optionOf(left(l));
            },
            (r) {
              _authBloc.add(const AuthEvent.authCheckRequested());
              return optionOf(right(unit));
            },
          ),
        );
      },
    );
  }
}
