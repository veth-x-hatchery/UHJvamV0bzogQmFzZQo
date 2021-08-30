part of 'local_authentication_bloc.dart';

@freezed
class AuthenticationBlocEvent with _$AuthenticationBlocEvent {
  const factory AuthenticationBlocEvent.started() = _Started;
  const factory AuthenticationBlocEvent.request() = _Request;
}
