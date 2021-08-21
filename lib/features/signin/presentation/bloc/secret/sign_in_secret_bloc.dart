import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';

part 'sign_in_secret_event.dart';
part 'sign_in_secret_state.dart';
part 'sign_in_secret_bloc.freezed.dart';

class SignInSecretBloc extends Bloc<SignInSecretEvent, SignInSecretState> {
  final AuthBloc _authBloc;
  final SignInWithCredentialAndSecret _signInWithCredentialAndSecret;

  SignInSecretBloc(
    this._authBloc,
    this._signInWithCredentialAndSecret,
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
        );
      },
      analyseSecretPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInWithCredentialAndSecret.call(Params(
          credentials: Credentials(
            secret: state.secret,
            // Todo(v): Remove it! User and Secret cannot cohabited same space in time.
            // Todo(v): User and Secret -> replace credential and secret
            user: CredentialAddress(''),
          ),
        ));
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => optionOf(left(l)), // Todo(v): Simplify it
            (r) {
              _authBloc.add(const AuthEvent.authCheckRequested());
              return none();
            },
          ),
        );
      },
    );
  }
}
