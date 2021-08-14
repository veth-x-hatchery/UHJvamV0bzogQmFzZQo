import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart'
    as a;
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final a.SignInCheckIfEmailIsInUse signInCheckIfEmailIsInUse;
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final SignInWithGoogle signInWithGoogle;

  SignInBloc({
    required this.signInWithGoogle,
    required this.signInWithEmailAndPassword,
    required this.signInCheckIfEmailIsInUse,
  }) : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInCheckEmail) {
      yield* _signInCheckEmail(
          await signInCheckIfEmailIsInUse.call(a.Params(email: event.email)));
    }
  }

  Stream<SignInState> _signInCheckEmail(Either<Failure, bool> usecase) async* {
    yield SignInLoading();
    yield usecase.fold(
      (failure) => failure.message == null
          ? SignInError()
          : SignInError(message: failure.message!),
      (alreadyRegistered) =>
          alreadyRegistered ? EmailAlreadyRegistered() : EmailNotFound(),
    );
  }
}
