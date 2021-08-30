part of 'local_authentication_bloc.dart';

@freezed
class LocalAuthenticationState with _$LocalAuthenticationState {
  const factory LocalAuthenticationState.initial() = _Initial;
  const factory LocalAuthenticationState.authorized() = _Authorized;
  const factory LocalAuthenticationState.unauthorized() = _Unauthorized;
}
