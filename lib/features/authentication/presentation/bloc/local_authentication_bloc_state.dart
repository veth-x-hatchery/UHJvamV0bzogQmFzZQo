part of 'local_authentication_bloc.dart';

@freezed
class AuthenticationBlocState with _$AuthenticationBlocState {
  const factory AuthenticationBlocState.initial() = _Initial;
  const factory AuthenticationBlocState.authorized() = _Authorized;
  const factory AuthenticationBlocState.unauthorized() = _Unauthorized;
}
