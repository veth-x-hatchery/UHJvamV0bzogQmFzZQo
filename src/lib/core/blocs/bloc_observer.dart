import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatchery/core/utils/logger.dart';

/// An interface for observing the behavior of [Bloc] instances.
class CustomBlocObserver extends BlocObserver {
  /// Called whenever a [Bloc] is instantiated.
  /// In many cases, a cubit may be lazily instantiated and
  /// [onCreate] can be used to observe exactly when the cubit
  /// instance is created.
  @override
  void onCreate(BlocBase bloc) {
    Logger.bloc('CustomBlocObserver -> onCreate');
    super.onCreate(bloc);
  }

  /// Called whenever an [event] is `added` to any [bloc] with the given [bloc]
  /// and [event].
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger.bloc('CustomBlocObserver -> onEvent: $event');
    super.onEvent(bloc, event);
  }

  /// Called whenever a [Change] occurs in any [bloc]
  /// A [change] occurs when a new state is emitted.
  /// [onChange] is called before a bloc's state has been updated.
  @override
  void onChange(BlocBase bloc, Change change) {
    Logger.bloc('CustomBlocObserver -> onChange: $change');
    super.onChange(bloc, change);
  }

  /// Called whenever a transition occurs in any [bloc] with the given [bloc]
  /// and [transition].
  /// A [transition] occurs when a new `event` is `added` and `mapEventToState`
  /// executed.
  /// [onTransition] is called before a [bloc]'s state has been updated.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger.bloc('CustomBlocObserver -> onTransition: $transition');
    super.onTransition(bloc, transition);
  }

  /// Called whenever an [error] is thrown in any [Bloc] or [Cubit].
  /// The [stackTrace] argument may be [StackTrace.empty] if an error
  /// was received without a stack trace.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.bloc('CustomBlocObserver -> onError',
        exception: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  /// Called whenever a [Bloc] is closed.
  /// [onClose] is called just before the [Bloc] is closed
  /// and indicates that the particular instance will no longer
  /// emit new states.
  @override
  void onClose(BlocBase bloc) {
    Logger.bloc('CustomBlocObserver -> onClose');
    super.onClose(bloc);
  }
}
