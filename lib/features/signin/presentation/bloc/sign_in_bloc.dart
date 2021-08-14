import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final SignInWithGoogle signInWithGoogle;
  final CustomValidators validators;

  SignInBloc({
    required this.signInWithGoogle,
    required this.signInWithEmailAndPassword,
    required this.validators,
  }) : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    // Immediately branching the logic with type checking, in order
    // for the event to be smart casted
    if (event is SignInCheckEmail) {
      final emailAnalysis = validators.emailAnalysis(event.email);
      yield* emailAnalysis.fold(
        (failure) async* {
          yield SignInError(message: failure.message);
        },
        (email) async* {
          yield SignInLoading();
          // final failureOrTrivia = await ???(Params(
          //   credentials: Credentials(
          //     user: email,
          //   ),
          // ));
          yield* throw UnimplementedError();
        },
      );
    }
  }
}
