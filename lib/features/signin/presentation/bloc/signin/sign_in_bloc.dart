import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart'
    as a;
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_email_and_password.dart'
    as b;
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart'
    as c;
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Use Cases
  final a.SignInCheckIfEmailIsInUse _checkIfEmailIsInUse;
  final b.SignInRegisterEmailAndPassword _signInRegisterEmailAndPassword;
  final c.SignInWithEmailAndPassword _signInWithEmailAndPassword;
  final SignInWithGoogle _signInWithGoogle;

  final AuthBloc _authBloc;
  final NavigationCubit _navigation;

  SignInBloc(
    this._checkIfEmailIsInUse,
    this._signInWithEmailAndPassword,
    this._signInWithGoogle,
    this._signInRegisterEmailAndPassword,
    this._authBloc,
    this._navigation,
  ) : super(const SignInState.initial());

  @override
  void emit(SignInState state) {
    if ([
      const SignInState.signInAllowed(),
      const SignInState.signInDenied(),
    ].contains(state)) {
      _authBloc.add(const AuthEvent.authCheckRequested());
    }
    super.emit(state);
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.map(
      checkEmailEvent: _checkEmail,
      emailRegisterEvent: _register,
      signInWithEmailEvent: _signInWithEmail,
      signInWithGoogleEvent: _google,
      started: (_Started value) => Stream.value(const SignInState.initial()),
    );
  }

  Stream<SignInState> _google(SignInWithGoogleEvent event) async* {
    yield const SignInState.loading();
    final usecase = await _signInWithGoogle.call(NoParams());
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (_) => const SignInState.signInAllowed(),
    );
  }

  Stream<SignInState> _signInWithEmail(SignInWithEmailEvent event) async* {
    yield const SignInState.loading();
    final usecase = await _signInWithEmailAndPassword.call(
      c.Params(
        credentials: Credentials(
          user: event.email,
          password: event.password,
        ),
      ),
    );
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (_) => const SignInState.signInAllowed(),
    );
  }

  Stream<SignInState> _register(EmailRegisterEvent event) async* {
    yield const SignInState.loading();
    final usecase = await _signInRegisterEmailAndPassword.call(
      b.Params(
        credentials: Credentials(
          user: event.email,
          password: event.password,
        ),
      ),
    );
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (_) => const SignInState.signInAllowed(),
    );
  }

  Stream<SignInState> _checkEmail(CheckEmailEvent event) async* {
    yield const SignInState.loading();
    final usecase =
        await _checkIfEmailIsInUse.call(a.Params(email: event.email));
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (emailIsInUse) {
        if (event.fromPage == SignInPageRoutes.emailEntry) {
          _navigation.goTo(SignInPageGoTo(
            from: SignInPageRoutes.emailEntry,
            to: emailIsInUse
                ? SignInPageRoutes.passwordEntry
                : SignInPageRoutes.registerEmailSignIn,
            parameters: event.email.getOrCrash(),
          ));
        }
        return emailIsInUse
            ? const SignInState.emailAlreadyRegistered()
            : const SignInState.emailNotFound();
      },
    );
  }

  SignInState _mapFailureToSignStateErrorMessage(FailureDetails failure) {
    if (failure.failure == const AuthFailure.cancelledByUser()) {
      return const SignInState.signInCancelled();
    }
    return SignInState.signInNotification(message: failure.message);
  }
}
