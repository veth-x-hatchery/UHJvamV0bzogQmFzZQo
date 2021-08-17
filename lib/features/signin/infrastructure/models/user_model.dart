import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';

enum SignInProviderUserAuthType {
  facebook,
  google,
  email,
  test,
}

class UserModel  {
  final String authType;

  const UserModel({
    required this.authType,
    required String email,
  }) );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      authType: json['authType'] as String,
    );
  }

  SignInProviderUserAuthType getAuthType() {
    switch (authType) {
      case 'facebook':
        return SignInProviderUserAuthType.facebook;
      case 'google':
        return SignInProviderUserAuthType.google;
      case 'test':
        return SignInProviderUserAuthType.test;
      case 'email':
      default:
        return SignInProviderUserAuthType.email;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authType'] = authType;
    data['email'] = email;
    return data;
  }
}
