import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  final SignInBloc _signInBloc;
  late final StreamSubscription _signInBlocSubscription;

  AuthBloc(
    this._authFacade,
    this._signInBloc,
  ) : super(const _Initial()) {
    _signInBlocSubscription = _signInBloc.stream.listen((event) => [
          const SignInState.signInAllowed(),
          const SignInState.signInDenied(),
        ].contains(event)
            ? add(const AuthEvent.authCheckRequested())
            : null);
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        yield await _authFacade.getSignedInUser().then((user) => user == null
            ? const AuthState.unauthenticated()
            : AuthState.authenticated(user));
      },
      signedOut: (e) async* {
        yield await _authFacade
            .signOut()
            .then((_) => const AuthState.unauthenticated());
      },
    );
  }

  @override
  Future<void> close() {
    _signInBlocSubscription.cancel();
    return super.close();
  }
}
