part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.goTo(SignInPageGoTo params) = _GoTo;
}
