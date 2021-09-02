import 'package:flutter/material.dart';
import 'package:vethx_beta/ui/widgets/transitions/defaults.dart';

class SlideRightRoute<T> extends PageRouteBuilder<T> {
  @override
  Duration get transitionDuration => DefaultAnimationSettings.duration;

  @override
  Duration get reverseTransitionDuration => DefaultAnimationSettings.duration;

  SlideRightRoute({required Widget page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(DefaultAnimationSettings.pageCurve(animation)),
            child: child,
          ),
        );
}

class SlideLeftRoute<T> extends PageRouteBuilder<T> {
  @override
  Duration get transitionDuration => DefaultAnimationSettings.duration;

  @override
  Duration get reverseTransitionDuration => DefaultAnimationSettings.duration;

  SlideLeftRoute({
    required this.page,
    RouteSettings? settings,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          settings: settings,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(DefaultAnimationSettings.pageCurve(animation)),
            child: child,
          ),
        );
  final Widget page;
}

class SlideTopRoute<T> extends PageRouteBuilder<T> {
  @override
  Duration get transitionDuration => DefaultAnimationSettings.duration;

  @override
  Duration get reverseTransitionDuration => DefaultAnimationSettings.duration;

  SlideTopRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(DefaultAnimationSettings.pageCurve(animation)),
            child: child,
          ),
        );
  final Widget page;
}

class SlideBottomRoute<T> extends PageRouteBuilder<T> {
  @override
  Duration get transitionDuration => DefaultAnimationSettings.duration;

  @override
  Duration get reverseTransitionDuration => DefaultAnimationSettings.duration;

  SlideBottomRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(DefaultAnimationSettings.pageCurve(animation)),
            child: child,
          ),
        );
  final Widget page;
}
