import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_credential_and_password.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';

part 'sign_in_password_event.dart';
part 'sign_in_password_state.dart';
part 'sign_in_password_bloc.freezed.dart';

class SignInPasswordBloc
    extends Bloc<SignInPasswordEvent, SignInPasswordState> {
  final AuthBloc _authBloc;
  final SignInWithCredentialAndPassword _signInWithCredentialAndPassword;

  SignInPasswordBloc(
    this._authBloc,
    this._signInWithCredentialAndPassword,
  ) : super(SignInPasswordState.initial());

  @override
  Stream<SignInPasswordState> mapEventToState(
    SignInPasswordEvent event,
  ) async* {
    yield* event.map(
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      analysePasswordPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInWithCredentialAndPassword.call(Params(
          credentials: Credentials(
            password: state.password,
            // Todo(v): Remove it! User and Password cannot cohabited same space in time.
            // Todo(v): User and Secret -> replace credential and password
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
