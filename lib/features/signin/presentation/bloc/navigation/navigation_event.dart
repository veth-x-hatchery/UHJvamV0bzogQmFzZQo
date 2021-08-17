part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.started() = _Started;
  const factory NavigationEvent.goTo(SignInPageGoTo params) =
      NavigationEventGoTo;
}
