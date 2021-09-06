import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const _Initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        yield const AuthState.inProcess();
        yield await _authFacade.getSignedInUser().then((user) => user == null
            ? const AuthState.unauthenticated()
            : AuthState.authenticated(user));
      },
      signedOut: (e) async* {
        yield const AuthState.inProcess();
        yield await _authFacade
            .signOut()
            .then((_) => const AuthState.unauthenticated());
      },
    );
  }
}
