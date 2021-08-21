import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_credential_event.dart';
part 'sign_in_credential_state.dart';
part 'sign_in_credential_bloc.freezed.dart';

class SignInCredentialBloc
    extends Bloc<SignInCredentialEvent, SignInCredentialState> {
  final SignInCheckIfCredentialIsInUse _signInCheckIfCredentialIsInUse;
  final NavigationCubit _navigation;

  SignInCredentialBloc(
    this._signInCheckIfCredentialIsInUse,
    this._navigation,
  ) : super(SignInCredentialState.initial());

  @override
  Stream<SignInCredentialState> mapEventToState(
    SignInCredentialEvent event,
  ) async* {
    yield* event.map(
      credentialChanged: (e) async* {
        yield state.copyWith(
          credential: CredentialAddress(e.credentialStr),
          authFailureOrSuccessOption: none(),
        );
      },
      analyseCredentialPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInCheckIfCredentialIsInUse
            .call(Params(credential: state.credential));
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => optionOf(left(l)), // Todo(v): Simplify it
            (isAlreadyInUse) {
              _navigation.goTo(isAlreadyInUse
                  ? SignInPageGoTo.secretPage(
                      from: SignInPageRoutes.credentialEntry)
                  : SignInPageGoTo.registerPage(
                      from: SignInPageRoutes.credentialEntry));
              return none();
            },
          ),
        );
      },
    );
  }
}
