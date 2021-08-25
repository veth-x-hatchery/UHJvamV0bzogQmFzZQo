// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/presentation/bloc/options/sign_in_options_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i6;
import 'package:dartz/dartz.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart'
    as _i9;
import 'package:vethx_beta/features/signin/domain/core/usecase.dart' as _i10;
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart'
    as _i8;
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart'
    as _i2;
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart'
    as _i4;
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart'
    as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAuthState_0 extends _i1.Fake implements _i2.AuthState {}

class _FakeStreamSubscription_1<T> extends _i1.Fake
    implements _i3.StreamSubscription<T> {}

class _FakeNavigationState_2 extends _i1.Fake implements _i4.NavigationState {}

class _FakeEither_3<L, R> extends _i1.Fake implements _i5.Either<L, R> {}

/// A class which mocks [AuthBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthBloc extends _i1.Mock implements _i2.AuthBloc {
  MockAuthBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeAuthState_0()) as _i2.AuthState);
  @override
  _i3.Stream<_i2.AuthState> get stream => (super.noSuchMethod(
      Invocation.getter(#stream),
      returnValue: Stream<_i2.AuthState>.empty()) as _i3.Stream<_i2.AuthState>);
  @override
  _i3.Stream<_i2.AuthState> mapEventToState(_i2.AuthEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i2.AuthState>.empty())
          as _i3.Stream<_i2.AuthState>);
  @override
  void add(_i2.AuthEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.AuthEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>> transformEvents(
          _i3.Stream<_i2.AuthEvent>? events,
          _i6.TransitionFunction<_i2.AuthEvent, _i2.AuthState>? transitionFn) =>
      (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue:
                  Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>>.empty())
          as _i3.Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>>);
  @override
  void emit(_i2.AuthState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(_i6.Transition<_i2.AuthEvent, _i2.AuthState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>> transformTransitions(
          _i3.Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>>?
              transitions) =>
      (super.noSuchMethod(
              Invocation.method(#transformTransitions, [transitions]),
              returnValue:
                  Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>>.empty())
          as _i3.Stream<_i6.Transition<_i2.AuthEvent, _i2.AuthState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i2.AuthState> listen(
          void Function(_i2.AuthState)? onData,
          {Function? onError,
          void Function()? onDone,
          bool? cancelOnError}) =>
      (super.noSuchMethod(
              Invocation.method(#listen, [
                onData
              ], {
                #onError: onError,
                #onDone: onDone,
                #cancelOnError: cancelOnError
              }),
              returnValue: _FakeStreamSubscription_1<_i2.AuthState>())
          as _i3.StreamSubscription<_i2.AuthState>);
  @override
  void onChange(_i6.Change<_i2.AuthState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NavigationManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationManager extends _i1.Mock implements _i4.NavigationManager {
  MockNavigationManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.NavigationState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
          returnValue: _FakeNavigationState_2()) as _i4.NavigationState);
  @override
  _i3.Stream<_i4.NavigationState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i4.NavigationState>.empty())
          as _i3.Stream<_i4.NavigationState>);
  @override
  void goTo(_i7.SignInPageGoTo? parameters) =>
      super.noSuchMethod(Invocation.method(#goTo, [parameters]),
          returnValueForMissingStub: null);
  @override
  _i3.StreamSubscription<_i4.NavigationState> listen(
          void Function(_i4.NavigationState)? onData,
          {Function? onError,
          void Function()? onDone,
          bool? cancelOnError}) =>
      (super.noSuchMethod(
              Invocation.method(#listen, [
                onData
              ], {
                #onError: onError,
                #onDone: onDone,
                #cancelOnError: cancelOnError
              }),
              returnValue: _FakeStreamSubscription_1<_i4.NavigationState>())
          as _i3.StreamSubscription<_i4.NavigationState>);
  @override
  void emit(_i4.NavigationState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onChange(_i6.Change<_i4.NavigationState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SignInWithGoogle].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInWithGoogle extends _i1.Mock implements _i8.SignInWithGoogle {
  MockSignInWithGoogle() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i5.Either<_i9.FailureDetails, _i5.Unit>> call(
          _i10.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i5.Either<_i9.FailureDetails, _i5.Unit>>.value(
              _FakeEither_3<_i9.FailureDetails, _i5.Unit>())) as _i3
          .Future<_i5.Either<_i9.FailureDetails, _i5.Unit>>);
  @override
  String toString() => super.toString();
}
