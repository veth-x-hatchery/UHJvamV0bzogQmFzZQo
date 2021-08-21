import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_password.dart';

part 'sign_in_register_event.dart';
part 'sign_in_register_state.dart';
part 'sign_in_register_bloc.freezed.dart';

class SignInRegisterBloc
    extends Bloc<SignInRegisterEvent, SignInRegisterState> {
  final SignInRegisterEmailAndPassword _signInRegisterEmailAndPassword;

  SignInRegisterBloc(this._signInRegisterEmailAndPassword)
      : super(SignInRegisterState.initial());

  @override
  Stream<SignInRegisterState> mapEventToState(
    SignInRegisterEvent event,
  ) async* {
    yield* event.map(
      credentialChanged: (e) async* {
        yield state.copyWith(
          credential: EmailAddress(e.credentialStr),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInRegisterEmailAndPassword.call(
          Params(
              credentials: Credentials(
            user: state.credential,
            password: state.password,
          )),
        );
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => some(result), // Todo(v): Simplify it
            (r) => none(),
          ),
        );
      },
    );
  }
}
