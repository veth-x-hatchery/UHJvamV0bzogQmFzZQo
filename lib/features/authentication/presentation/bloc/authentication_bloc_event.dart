part of 'authentication_bloc_bloc.dart';

@freezed
class AuthenticationBlocEvent with _$AuthenticationBlocEvent {
  const factory AuthenticationBlocEvent.started() = _Started;
}