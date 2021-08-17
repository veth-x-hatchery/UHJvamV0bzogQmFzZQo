import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';
part 'navigation_bloc.freezed.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const _Initial());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    yield event.map(
      started: (_) => const NavigationState.initial(),
      goTo: (goTo) => NavigationState.goTo(goTo.params),
    );
  }

  void goTo(SignInPageGoTo params) {
    Logger.i('NavigationBloc -> $params');
    add(NavigationEvent.goTo(params));
  }
}
