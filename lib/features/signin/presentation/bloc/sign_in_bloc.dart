import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/utils/logger.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart'
    as a;
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  //! Use Cases

  final a.SignInCheckIfEmailIsInUse _checkIfEmailIsInUse;
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  final SignInWithGoogle _signInWithGoogle;

  //! Page flow dependencies
  final _signInPageRoutesController =
      StreamController<SignInPageGoTo>.broadcast();
  Stream<SignInPageGoTo> get goTo => _signInPageRoutesController.stream;

  SignInBloc(
    this._checkIfEmailIsInUse,
    this._signInWithEmailAndPassword,
    this._signInWithGoogle,
  ) : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInCheckEmail) {
      yield* _checkEmail(event);
    }
  }

  Stream<SignInState> _checkEmail(SignInCheckEmail event) async* {
    final usecase =
        await _checkIfEmailIsInUse.call(a.Params(email: event.email));
    yield SignInLoading();
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (emailIsInUse) {
        if (event.fromPage == SignInPageRoutes.emailEntry) {
          goToPage(SignInPageGoTo(
            from: SignInPageRoutes.emailEntry,
            to: emailIsInUse
                ? SignInPageRoutes.passwordEntry
                : SignInPageRoutes.registerEmailSignIn,
          ));
        }
        return emailIsInUse ? EmailAlreadyRegistered() : EmailNotFound();
      },
    );
  }

  SignInState _mapFailureToSignStateErrorMessage(Failure failure) =>
      failure.message == null
          ? SignInError()
          : SignInError(message: failure.message!);

  void goToPage(SignInPageGoTo page) {
    Logger.i('SignInNavigationBloc -> $page');
    _signInPageRoutesController.add(page);
  }

  @override
  Future<void> close() async {
    await _signInPageRoutesController.close();
    return super.close();
  }
}
