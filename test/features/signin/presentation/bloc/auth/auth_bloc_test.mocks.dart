// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/presentation/bloc/auth/auth_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:bloc/bloc.dart' as _i10;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as _i6;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart'
    as _i8;
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart'
    as _i7;
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart'
    as _i5;
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart'
    as _i3;
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart'
    as _i9;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeSignInState_1 extends _i1.Fake implements _i3.SignInState {}

class _FakeStreamSubscription_2<T> extends _i1.Fake
    implements _i4.StreamSubscription<T> {}

/// A class which mocks [IAuthFacade].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthFacade extends _i1.Mock implements _i5.IAuthFacade {
  MockIAuthFacade() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i6.User?> getSignedInUser() =>
      (super.noSuchMethod(Invocation.method(#getSignedInUser, []),
          returnValue: Future<_i6.User?>.value()) as _i4.Future<_i6.User?>);
  @override
  _i4.Future<_i2.Either<_i7.AuthFailure, bool>> emailIsAlreadyInUse(
          _i8.EmailAddress? emailAddress) =>
      (super.noSuchMethod(
              Invocation.method(#emailIsAlreadyInUse, [emailAddress]),
              returnValue: Future<_i2.Either<_i7.AuthFailure, bool>>.value(
                  _FakeEither_0<_i7.AuthFailure, bool>()))
          as _i4.Future<_i2.Either<_i7.AuthFailure, bool>>);
  @override
  _i4.Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>
      registerWithEmailAndPassword(
              {_i8.EmailAddress? emailAddress, _i8.Password? password}) =>
          (super.noSuchMethod(
              Invocation.method(#registerWithEmailAndPassword, [],
                  {#emailAddress: emailAddress, #password: password}),
              returnValue: Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i7.AuthFailure, _i2.Unit>())) as _i4
              .Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i7.AuthFailure, _i2.Unit>> signInWithEmailAndPassword(
          {_i8.EmailAddress? emailAddress, _i8.Password? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#emailAddress: emailAddress, #password: password}),
              returnValue: Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i7.AuthFailure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i7.AuthFailure, _i2.Unit>> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i7.AuthFailure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i7.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SignInBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInBloc extends _i1.Mock implements _i3.SignInBloc {
  MockSignInBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i9.SignInPageGoTo> get goTo =>
      (super.noSuchMethod(Invocation.getter(#goTo),
              returnValue: Stream<_i9.SignInPageGoTo>.empty())
          as _i4.Stream<_i9.SignInPageGoTo>);
  @override
  _i3.SignInState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeSignInState_1()) as _i3.SignInState);
  @override
  _i4.Stream<_i3.SignInState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i3.SignInState>.empty())
          as _i4.Stream<_i3.SignInState>);
  @override
  _i4.Stream<_i3.SignInState> mapEventToState(_i3.SignInEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i3.SignInState>.empty())
          as _i4.Stream<_i3.SignInState>);
  @override
  void goToPage(_i9.SignInPageGoTo? page) =>
      super.noSuchMethod(Invocation.method(#goToPage, [page]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void add(_i3.SignInEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i3.SignInEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<_i10.Transition<_i3.SignInEvent, _i3.SignInState>> transformEvents(
          _i4.Stream<_i3.SignInEvent>? events,
          _i10.TransitionFunction<_i3.SignInEvent, _i3.SignInState>?
              transitionFn) =>
      (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue: Stream<
                  _i10.Transition<_i3.SignInEvent, _i3.SignInState>>.empty())
          as _i4.Stream<_i10.Transition<_i3.SignInEvent, _i3.SignInState>>);
  @override
  void emit(_i3.SignInState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i10.Transition<_i3.SignInEvent, _i3.SignInState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i4.Stream<_i10.Transition<_i3.SignInEvent, _i3.SignInState>>
      transformTransitions(
              _i4.Stream<_i10.Transition<_i3.SignInEvent, _i3.SignInState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue: Stream<
                      _i10.Transition<_i3.SignInEvent, _i3.SignInState>>.empty())
              as _i4.Stream<_i10.Transition<_i3.SignInEvent, _i3.SignInState>>);
  @override
  _i4.StreamSubscription<_i3.SignInState> listen(
          void Function(_i3.SignInState)? onData,
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
              returnValue: _FakeStreamSubscription_2<_i3.SignInState>())
          as _i4.StreamSubscription<_i3.SignInState>);
  @override
  void onChange(_i10.Change<_i3.SignInState>? change) =>
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
