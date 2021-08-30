import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/authentication/domain/core/usecase.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authorization.usecase.dart';

part 'local_authentication_bloc.freezed.dart';
part 'local_authentication_bloc_event.dart';
part 'local_authentication_bloc_state.dart';

class LocalAuthenticationBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final RequestLocalAuthorization _usecase;
  LocalAuthenticationBloc(this._usecase) : super(const _Initial());

  @override
  Stream<AuthenticationBlocState> mapEventToState(
    AuthenticationBlocEvent event,
  ) async* {
    yield* event.map(
      started: (_) async* {},
      request: (e) async* {
        yield await _usecase.call(const NoParams()).then(
              (value) => value.fold(
                (failure) => const AuthenticationBlocState.unauthorized(),
                (allowed) => allowed
                    ? const AuthenticationBlocState.authorized()
                    : const AuthenticationBlocState.unauthorized(),
              ),
            );
      },
    );
  }
}
