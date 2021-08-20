import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';

part 'sign_in_email_event.dart';
part 'sign_in_email_state.dart';
part 'sign_in_email_bloc.freezed.dart';

class SignInEmailBloc extends Bloc<SignInEmailEvent, SignInEmailState> {
  final SignInCheckIfEmailIsInUse _signInCheckIfEmailIsInUse;

  SignInEmailBloc(this._signInCheckIfEmailIsInUse)
      : super(SignInEmailState.initial());

  @override
  Stream<SignInEmailState> mapEventToState(
    SignInEmailEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          email: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      analyseEmailPressed: (e) async* {
        yield state.copyWith(
          isLoading: true,
          authFailureOrSuccessOption: none(),
        );
        final result =
            await _signInCheckIfEmailIsInUse.call(Params(email: state.email));
        yield state.copyWith(
          isLoading: false,
          authFailureOrSuccessOption: result.fold(
            (l) => optionOf(left(l)), // Todo(v): Simplify it
            (r) => none(),
          ),
        );
      },
    );
  }
}
