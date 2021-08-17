part of 'navigation_cubit.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.goTo(SignInPageGoTo params) = _GoTo;
}
