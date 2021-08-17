import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_go_to.freezed.dart';

enum SignInPageRoutes {
  signInOptions,
  emailEntry,
  passwordEntry,
  registerEmailSignIn,
}

@freezed
class SignInPageGoTo with _$SignInPageGoTo {
  factory SignInPageGoTo({
    required SignInPageRoutes from,
    required SignInPageRoutes to,
    Object? parameters,
  }) = _SignInPageGoTo;
}
