import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Use Cases
  final SignInWithGoogle _signInWithGoogle;
  final AuthBloc _authBloc;
  final NavigationCubit _navigation;

  SignInBloc(
    this._authBloc,
    this._navigation,
    this._signInWithGoogle,
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
    yield event.map(
      signInWithGoogleEvent: _google,
      signInWithEmailEvent: (e) => const SignInState.initial(),
      started: (_Started value) => const SignInState.initial(),
    );
  }

  Stream<SignInState> _google(SignInWithGoogleEvent event) async* {
    yield const SignInState.loading();
    final usecase = await _signInWithGoogle.call(const NoParams());
    yield usecase.fold(
      _mapFailureToSignStateErrorMessage,
      (_) => const SignInState.signInAllowed(),
    );
  }

  SignInState _mapFailureToSignStateErrorMessage(FailureDetails failure) {
    if (failure.failure == const AuthFailure.cancelledByUser()) {
      return const SignInState.signInCancelled();
    }
    return SignInState.signInNotification(message: failure.message);
  }
}
