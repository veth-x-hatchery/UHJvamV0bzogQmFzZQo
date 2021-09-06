// Mocks generated by Mockito 5.0.15 from annotations
// in vethx_beta/test/helpers/features/signin/sign_in_service_locator.mock.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart'
    as _i4;
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart'
    as _i2;
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart'
    as _i5;
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart'
    as _i7;
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart'
    as _i6;
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart'
    as _i9;
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart'
    as _i10;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSignInOptionsState_0 extends _i1.Fake
    implements _i2.SignInOptionsState {}

class _FakeStreamSubscription_1<T> extends _i1.Fake
    implements _i3.StreamSubscription<T> {}

class _FakeSignInCredentialState_2 extends _i1.Fake
    implements _i4.SignInCredentialState {}

class _FakeSignInRegisterState_3 extends _i1.Fake
    implements _i5.SignInRegisterState {}

class _FakeSignInSecretState_4 extends _i1.Fake
    implements _i6.SignInSecretState {}

class _FakeSignInSecretResetState_5 extends _i1.Fake
    implements _i7.SignInSecretResetState {}

/// A class which mocks [SignInOptionsBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInOptionsBloc extends _i1.Mock implements _i2.SignInOptionsBloc {
  MockSignInOptionsBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SignInOptionsState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
          returnValue: _FakeSignInOptionsState_0()) as _i2.SignInOptionsState);
  @override
  _i3.Stream<_i2.SignInOptionsState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.SignInOptionsState>.empty())
          as _i3.Stream<_i2.SignInOptionsState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void emit(_i2.SignInOptionsState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i2.SignInOptionsState> mapEventToState(
          _i2.SignInOptionsEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i2.SignInOptionsState>.empty())
          as _i3.Stream<_i2.SignInOptionsState>);
  @override
  void add(_i2.SignInOptionsEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.SignInOptionsEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>
      transformEvents(
              _i3.Stream<_i2.SignInOptionsEvent>? events,
              _i8.TransitionFunction<_i2.SignInOptionsEvent, _i2.SignInOptionsState>?
                  transitionFn) =>
          (super.noSuchMethod(
                  Invocation.method(#transformEvents, [events, transitionFn]),
                  returnValue:
                      Stream<_i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>);
  @override
  void onTransition(
          _i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>
      transformTransitions(
              _i3.Stream<_i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue:
                      Stream<_i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i2.SignInOptionsEvent, _i2.SignInOptionsState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i2.SignInOptionsState> listen(
          void Function(_i2.SignInOptionsState)? onData,
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
              returnValue: _FakeStreamSubscription_1<_i2.SignInOptionsState>())
          as _i3.StreamSubscription<_i2.SignInOptionsState>);
  @override
  void onChange(_i8.Change<_i2.SignInOptionsState>? change) =>
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

/// A class which mocks [SignInCredentialBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInCredentialBloc extends _i1.Mock
    implements _i4.SignInCredentialBloc {
  MockSignInCredentialBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.SignInCredentialState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeSignInCredentialState_2())
          as _i4.SignInCredentialState);
  @override
  _i3.Stream<_i4.SignInCredentialState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i4.SignInCredentialState>.empty())
          as _i3.Stream<_i4.SignInCredentialState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i4.SignInCredentialState> mapEventToState(
          _i4.SignInCredentialEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i4.SignInCredentialState>.empty())
          as _i3.Stream<_i4.SignInCredentialState>);
  @override
  void add(_i4.SignInCredentialEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i4.SignInCredentialEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>
      transformEvents(
              _i3.Stream<_i4.SignInCredentialEvent>? events,
              _i8.TransitionFunction<_i4.SignInCredentialEvent,
                      _i4.SignInCredentialState>?
                  transitionFn) =>
          (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue:
                  Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>.empty()) as _i3
              .Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>);
  @override
  void emit(_i4.SignInCredentialState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>
      transformTransitions(
              _i3.Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue:
                      Stream<_i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i4.SignInCredentialEvent, _i4.SignInCredentialState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i4.SignInCredentialState> listen(
          void Function(_i4.SignInCredentialState)? onData,
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
              returnValue:
                  _FakeStreamSubscription_1<_i4.SignInCredentialState>())
          as _i3.StreamSubscription<_i4.SignInCredentialState>);
  @override
  void onChange(_i8.Change<_i4.SignInCredentialState>? change) =>
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

/// A class which mocks [SignInRegisterBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInRegisterBloc extends _i1.Mock
    implements _i5.SignInRegisterBloc {
  MockSignInRegisterBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.SignInRegisterState get state => (super.noSuchMethod(
      Invocation.getter(#state),
      returnValue: _FakeSignInRegisterState_3()) as _i5.SignInRegisterState);
  @override
  _i3.Stream<_i5.SignInRegisterState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i5.SignInRegisterState>.empty())
          as _i3.Stream<_i5.SignInRegisterState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i5.SignInRegisterState> mapEventToState(
          _i5.SignInRegisterEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i5.SignInRegisterState>.empty())
          as _i3.Stream<_i5.SignInRegisterState>);
  @override
  void add(_i5.SignInRegisterEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i5.SignInRegisterEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>
      transformEvents(
              _i3.Stream<_i5.SignInRegisterEvent>? events,
              _i8.TransitionFunction<_i5.SignInRegisterEvent, _i5.SignInRegisterState>?
                  transitionFn) =>
          (super.noSuchMethod(
                  Invocation.method(#transformEvents, [events, transitionFn]),
                  returnValue:
                      Stream<_i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>);
  @override
  void emit(_i5.SignInRegisterState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>
      transformTransitions(
              _i3.Stream<_i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue:
                      Stream<_i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i5.SignInRegisterEvent, _i5.SignInRegisterState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i5.SignInRegisterState> listen(
          void Function(_i5.SignInRegisterState)? onData,
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
              returnValue: _FakeStreamSubscription_1<_i5.SignInRegisterState>())
          as _i3.StreamSubscription<_i5.SignInRegisterState>);
  @override
  void onChange(_i8.Change<_i5.SignInRegisterState>? change) =>
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

/// A class which mocks [SignInSecretBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInSecretBloc extends _i1.Mock implements _i6.SignInSecretBloc {
  MockSignInSecretBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.SignInSecretState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
          returnValue: _FakeSignInSecretState_4()) as _i6.SignInSecretState);
  @override
  _i3.Stream<_i6.SignInSecretState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i6.SignInSecretState>.empty())
          as _i3.Stream<_i6.SignInSecretState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i6.SignInSecretState> mapEventToState(
          _i6.SignInSecretEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i6.SignInSecretState>.empty())
          as _i3.Stream<_i6.SignInSecretState>);
  @override
  void add(_i6.SignInSecretEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i6.SignInSecretEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>
      transformEvents(
              _i3.Stream<_i6.SignInSecretEvent>? events,
              _i8.TransitionFunction<_i6.SignInSecretEvent, _i6.SignInSecretState>?
                  transitionFn) =>
          (super.noSuchMethod(
                  Invocation.method(#transformEvents, [events, transitionFn]),
                  returnValue:
                      Stream<_i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>);
  @override
  void emit(_i6.SignInSecretState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>
      transformTransitions(
              _i3.Stream<_i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue:
                      Stream<_i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i6.SignInSecretEvent, _i6.SignInSecretState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i6.SignInSecretState> listen(
          void Function(_i6.SignInSecretState)? onData,
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
              returnValue: _FakeStreamSubscription_1<_i6.SignInSecretState>())
          as _i3.StreamSubscription<_i6.SignInSecretState>);
  @override
  void onChange(_i8.Change<_i6.SignInSecretState>? change) =>
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

/// A class which mocks [SignInSecretResetBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInSecretResetBloc extends _i1.Mock
    implements _i7.SignInSecretResetBloc {
  MockSignInSecretResetBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.SignInSecretResetState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeSignInSecretResetState_5())
          as _i7.SignInSecretResetState);
  @override
  _i3.Stream<_i7.SignInSecretResetState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i7.SignInSecretResetState>.empty())
          as _i3.Stream<_i7.SignInSecretResetState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i3.Stream<_i7.SignInSecretResetState> mapEventToState(
          _i7.SignInSecretResetEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i7.SignInSecretResetState>.empty())
          as _i3.Stream<_i7.SignInSecretResetState>);
  @override
  void add(_i7.SignInSecretResetEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i7.SignInSecretResetEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>
      transformEvents(
              _i3.Stream<_i7.SignInSecretResetEvent>? events,
              _i8.TransitionFunction<_i7.SignInSecretResetEvent,
                      _i7.SignInSecretResetState>?
                  transitionFn) =>
          (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue:
                  Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>.empty()) as _i3
              .Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>);
  @override
  void emit(_i7.SignInSecretResetState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i8.Transition<_i7.SignInSecretResetEvent,
                  _i7.SignInSecretResetState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>
      transformTransitions(
              _i3.Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue:
                      Stream<_i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>.empty())
              as _i3.Stream<
                  _i8.Transition<_i7.SignInSecretResetEvent, _i7.SignInSecretResetState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i7.SignInSecretResetState> listen(
          void Function(_i7.SignInSecretResetState)? onData,
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
              returnValue:
                  _FakeStreamSubscription_1<_i7.SignInSecretResetState>())
          as _i3.StreamSubscription<_i7.SignInSecretResetState>);
  @override
  void onChange(_i8.Change<_i7.SignInSecretResetState>? change) =>
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
class MockNavigationManager extends _i1.Mock implements _i9.NavigationManager {
  MockNavigationManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i10.SignInPageGoTo> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i10.SignInPageGoTo>.empty())
          as _i3.Stream<_i10.SignInPageGoTo>);
  @override
  void goTo(_i10.SignInPageGoTo? parameters) =>
      super.noSuchMethod(Invocation.method(#goTo, [parameters]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
