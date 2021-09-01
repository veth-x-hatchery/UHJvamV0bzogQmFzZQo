import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_options_bloc.freezed.dart';
part 'sign_in_options_event.dart';
part 'sign_in_options_state.dart';

class SignInOptionsBloc extends Bloc<SignInOptionsEvent, SignInOptionsState> {
  final AuthBloc _authBloc;
  final NavigationManager _navigation;
  final SignInWithGoogle _signInWithGoogle;

  SignInOptionsBloc(
    this._authBloc,
    this._navigation,
    this._signInWithGoogle,
  ) : super(const SignInOptionsState.initial());

  @override
  void emit(SignInOptionsState state) {
    if ([
      const SignInOptionsState.signInAllowed(),
      const SignInOptionsState.signInDenied(),
    ].contains(state)) {
      _authBloc.add(const AuthEvent.authCheckRequested());
    }
    super.emit(state);
  }

  @override
  Stream<SignInOptionsState> mapEventToState(SignInOptionsEvent event) async* {
    yield* event.map(signInWithGoogleEvent: (e) async* {
      yield const SignInOptionsState.loading();
      final result = await _signInWithGoogle.call(const NoParams());
      yield result.fold(
        _mapFailureToSignStateErrorMessage,
        (_) => const SignInOptionsState.signInAllowed(),
      );
    }, signInWithCredentialEvent: (e) async* {
      _navigation.goTo(
          SignInPageGoTo.credentialPage(from: SignInPageRoutes.signInOptions));
      yield const SignInOptionsState.initial();
    });
  }

  SignInOptionsState _mapFailureToSignStateErrorMessage(
      FailureDetails failure) {
    if (failure.failure == const AuthFailure.cancelledByUser()) {
      return const SignInOptionsState.signInCancelled();
    }
    // Todo(v): remove this and use another state definition
    return SignInOptionsState.signInNotification(
      message: failure.message,
    );
  }
}
