import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/authentication/domain/core/usecase.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authorization.usecase.dart';

part 'local_authentication_bloc.freezed.dart';
part 'local_authentication_event.dart';
part 'local_authentication_state.dart';

class LocalAuthenticationBloc
    extends Bloc<LocalAuthenticationEvent, LocalAuthenticationState> {
  final RequestLocalAuthorization _usecase;
  LocalAuthenticationBloc(this._usecase) : super(const _Authorized());

  @override
  Stream<LocalAuthenticationState> mapEventToState(
    LocalAuthenticationEvent event,
  ) async* {
    yield* event.map(
      started: (_) async* {
        yield const LocalAuthenticationState.initial();
      },
      request: (e) async* {
        yield const LocalAuthenticationState.initial();
        yield await _usecase.call(const NoParams()).then(
              (value) => value.fold(
                (failure) => const LocalAuthenticationState.unauthorized(),
                (allowed) => allowed
                    ? const LocalAuthenticationState.authorized()
                    : const LocalAuthenticationState.unauthorized(),
              ),
            );
      },
    );
  }
}
