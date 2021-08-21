import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';

part 'sign_in_register_event.dart';
part 'sign_in_register_state.dart';
part 'sign_in_register_bloc.freezed.dart';

class SignInRegisterBloc
    extends Bloc<SignInRegisterEvent, SignInRegisterState> {
  final SignInRegisterCredentialAndSecret _signInRegisterCredentialAndSecret;
  final AuthBloc _authBloc;

  SignInRegisterBloc(
    this._authBloc,
    this._signInRegisterCredentialAndSecret,
  ) : super(SignInRegisterState.initial());

  @override
  Stream<SignInRegisterState> mapEventToState(
    SignInRegisterEvent event,
  ) async* {
    yield* event.map(
      credentialChanged: (e) async* {
        yield state.copyWith(
          credential: Credential(e.credentialStr),
          authFailureOrSuccessOption: none(),
        );
      },
      secretChanged: (e) async* {
        yield state.copyWith(
          secret: Secret(e.secretStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithCredentialAndSecretPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInRegisterCredentialAndSecret.call(
          Params(
              credentials: Credentials(
            user: state.credential,
            secret: state.secret,
          )),
        );
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => some(result),
            (r) {
              _authBloc.add(const AuthEvent.authCheckRequested());
              // _navigation.goTo(SignInPageGoTo.credentialPage(
              //     from: SignInPageRoutes.secretEntry));
              return none();
            },
          ),
        );
      },
    );
  }
}
