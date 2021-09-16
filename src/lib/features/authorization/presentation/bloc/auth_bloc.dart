import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatchery/features/signin/domain/entities/user_entity.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService _authService;

  AuthBloc(this._authService) : super(const _Initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        yield const AuthState.inProcess();
        yield await _authService.getSignedInUser().then((user) => user == null
            ? const AuthState.unauthenticated()
            : AuthState.authenticated(user));
      },
      signedOut: (e) async* {
        yield const AuthState.inProcess();
        yield await _authService
            .signOut()
            .then((_) => const AuthState.unauthenticated());
      },
    );
  }
}
