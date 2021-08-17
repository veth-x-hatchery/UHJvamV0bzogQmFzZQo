// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:vethx_beta/core/utils/logger.dart';
// import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
// import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
// import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
// import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
// import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
// import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart'
//     as a;
// import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_email_and_password.dart'
//     as b;
// import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart'
//     as c;
// import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
// import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';

// part 'sign_in_event.dart';
// part 'sign_in_state.dart';

// class SignInBloc extends Bloc<SignInEvent, SignInState> {
//   final a.SignInCheckIfEmailIsInUse _checkIfEmailIsInUse;
//   final b.SignInRegisterEmailAndPassword _signInRegisterEmailAndPassword;
//   final c.SignInWithEmailAndPassword _signInWithEmailAndPassword;
//   final SignInWithGoogle _signInWithGoogle;

//   final _signInPageRoutesController =
//       StreamController<SignInPageGoTo>.broadcast();
//   Stream<SignInPageGoTo> get goTo => _signInPageRoutesController.stream;

//   SignInBloc(
//     this._checkIfEmailIsInUse,
//     this._signInWithEmailAndPassword,
//     this._signInWithGoogle,
//     this._signInRegisterEmailAndPassword,
//   ) : super(SignInInitial());

//   @override
//   Stream<SignInState> mapEventToState(SignInEvent event) async* {
//     if (event is SignInCheckEmailEvent) {
//       yield* _checkEmail(event);
//     }
//     if (event is SignInEmailRegisterEvent) {
//       yield* _register(event);
//     }
//     if (event is SignInWithEmailEvent) {
//       yield* _signInWithEmail(event);
//     }
//     if (event is SignInWithGoogleEvent) {
//       yield* _google(event);
//     }
//   }

//   Stream<SignInState> _google(SignInWithGoogleEvent event) async* {
//     yield SignInLoading();
//     final usecase = await _signInWithGoogle.call(NoParams());
//     yield usecase.fold(
//       _mapFailureToSignStateErrorMessage,
//       (_) => SignInAllowed(),
//     );
//   }

//   Stream<SignInState> _signInWithEmail(SignInWithEmailEvent event) async* {
//     yield SignInLoading();
//     final usecase = await _signInWithEmailAndPassword.call(
//       c.Params(
//         credentials: Credentials(
//           user: event.email,
//           password: event.password,
//         ),
//       ),
//     );
//     yield usecase.fold(
//       _mapFailureToSignStateErrorMessage,
//       (_) {
//         return SignInAllowed();
//       },
//     );
//   }

//   Stream<SignInState> _register(SignInEmailRegisterEvent event) async* {
//     yield SignInLoading();
//     final usecase = await _signInRegisterEmailAndPassword.call(
//       b.Params(
//         credentials: Credentials(
//           user: event.email,
//           password: event.password,
//         ),
//       ),
//     );
//     yield usecase.fold(
//       _mapFailureToSignStateErrorMessage,
//       (_) {
//         return SignInAllowed();
//       },
//     );
//   }

//   Stream<SignInState> _checkEmail(SignInCheckEmailEvent event) async* {
//     yield SignInLoading();
//     final usecase =
//         await _checkIfEmailIsInUse.call(a.Params(email: event.email));
//     yield usecase.fold(
//       _mapFailureToSignStateErrorMessage,
//       (emailIsInUse) {
//         if (event.fromPage == SignInPageRoutes.emailEntry) {
//           goToPage(SignInPageGoTo(
//             from: SignInPageRoutes.emailEntry,
//             to: emailIsInUse
//                 ? SignInPageRoutes.passwordEntry
//                 : SignInPageRoutes.registerEmailSignIn,
//             parameters: event.email.getOrCrash(),
//           ));
//         }

//         return emailIsInUse ? EmailAlreadyRegistered() : EmailNotFound();
//       },
//     );
//   }

//   SignInState _mapFailureToSignStateErrorMessage(FailureDetails failure) {
//     if (failure.failure == const AuthFailure.cancelledByUser()) {
//       return SignInCancelled();
//     }
//     return SignInNotification(message: failure.message);
//   }

//   void goToPage(SignInPageGoTo page) {
//     Logger.i('$page');
//     _signInPageRoutesController.add(page);
//   }

//   @override
//   Future<void> close() async {
//     await _signInPageRoutesController.close();
//     return super.close();
//   }
// }
