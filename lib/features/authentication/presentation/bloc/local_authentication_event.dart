part of 'local_authentication_bloc.dart';

@freezed
class LocalAuthenticationEvent with _$LocalAuthenticationEvent {
  const factory LocalAuthenticationEvent.request() = _Request;
}
