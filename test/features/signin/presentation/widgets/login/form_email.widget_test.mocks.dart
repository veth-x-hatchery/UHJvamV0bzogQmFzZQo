// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/presentation/widgets/login/form_email.widget_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSignInState_0 extends _i1.Fake implements _i2.SignInState {}

class _FakeStreamSubscription_1<T> extends _i1.Fake
    implements _i3.StreamSubscription<T> {}

/// A class which mocks [SignInBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInBloc extends _i1.Mock implements _i2.SignInBloc {
  MockSignInBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SignInState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeSignInState_0()) as _i2.SignInState);
  @override
  _i3.Stream<_i2.SignInState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.SignInState>.empty())
          as _i3.Stream<_i2.SignInState>);
  @override
  void emit(_i2.SignInState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i2.SignInState> mapEventToState(_i2.SignInEvent? event) =>
      (super.noSuchMethod(Invocation.method(#mapEventToState, [event]),
              returnValue: Stream<_i2.SignInState>.empty())
          as _i3.Stream<_i2.SignInState>);
  @override
  void add(_i2.SignInEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.SignInEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i4.Transition<_i2.SignInEvent, _i2.SignInState>> transformEvents(
          _i3.Stream<_i2.SignInEvent>? events,
          _i4.TransitionFunction<_i2.SignInEvent, _i2.SignInState>?
              transitionFn) =>
      (super.noSuchMethod(
              Invocation.method(#transformEvents, [events, transitionFn]),
              returnValue: Stream<
                  _i4.Transition<_i2.SignInEvent, _i2.SignInState>>.empty())
          as _i3.Stream<_i4.Transition<_i2.SignInEvent, _i2.SignInState>>);
  @override
  void onTransition(
          _i4.Transition<_i2.SignInEvent, _i2.SignInState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Stream<_i4.Transition<_i2.SignInEvent, _i2.SignInState>>
      transformTransitions(
              _i3
                      .Stream<_i4.Transition<_i2.SignInEvent, _i2.SignInState>>?
                  transitions) =>
          (super.noSuchMethod(
                  Invocation.method(#transformTransitions, [transitions]),
                  returnValue: Stream<
                      _i4.Transition<_i2.SignInEvent, _i2.SignInState>>.empty())
              as _i3.Stream<_i4.Transition<_i2.SignInEvent, _i2.SignInState>>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i2.SignInState> listen(
          void Function(_i2.SignInState)? onData,
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
              returnValue: _FakeStreamSubscription_1<_i2.SignInState>())
          as _i3.StreamSubscription<_i2.SignInState>);
  @override
  void onChange(_i4.Change<_i2.SignInState>? change) =>
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
