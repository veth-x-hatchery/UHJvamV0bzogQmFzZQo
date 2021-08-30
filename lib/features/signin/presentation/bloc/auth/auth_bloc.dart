import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/services/auth/local_auth.service.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  final ILocalAuth _localAuth;

  AuthBloc(
    this._authFacade,
    this._localAuth,
  ) : super(const _Initial());

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
      localAuthCheckRequested: (e) async* {
        yield const AuthState.inProcess();
        final user = await _authFacade.getSignedInUser();
        if (user == null) {
          yield const AuthState.unauthenticated();
        } else {
          final localAuthResult = await _localAuth.authenticate();
          localAuthResult.fold(
            (l) => const AuthState.unauthenticated(),
            (r) => AuthState.authenticated(user),
          );
        }
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
