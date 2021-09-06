import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authentication.usecase.dart';

part 'local_authentication_bloc.freezed.dart';
part 'local_authentication_event.dart';
part 'local_authentication_state.dart';

class LocalAuthenticationBloc
    extends Bloc<LocalAuthenticationEvent, LocalAuthenticationState> {
  final RequestLocalAuthentication _usecase;
  LocalAuthenticationBloc(this._usecase) : super(const _Authorized());

  @override
  Stream<LocalAuthenticationState> mapEventToState(
    LocalAuthenticationEvent event,
  ) async* {
    yield* event.map(
      request: (e) async* {
        yield const LocalAuthenticationState.loading();
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
