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

class SignInEmailBloc extends Bloc<SignInEmailEvent, SignInEmailState> {
  final SignInCheckIfEmailIsInUse _signInCheckIfEmailIsInUse;
  final NavigationCubit _navigation;

  SignInEmailBloc(
    this._signInCheckIfEmailIsInUse,
    this._navigation,
  ) : super(SignInEmailState.initial());

  @override
  Stream<SignInEmailState> mapEventToState(
    SignInEmailEvent event,
  ) async* {
    yield* event.map(
      credentialChanged: (e) async* {
        yield state.copyWith(
          credential: EmailAddress(e.credentialStr),
          authFailureOrSuccessOption: none(),
        );
      },
      analyseEmailPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result = await _signInCheckIfEmailIsInUse
            .call(Params(credential: state.credential));
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => optionOf(left(l)), // Todo(v): Simplify it
            (isAlreadyInUse) {
              _navigation.goTo(isAlreadyInUse
                  ? SignInPageGoTo.passwordPage(
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
