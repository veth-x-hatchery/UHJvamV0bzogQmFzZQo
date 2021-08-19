// import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
// import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

// enum SignInProviderUserAuthType {
//   facebook,
//   google,
//   email,
//   test,
// }

// class UserModel extends User {
//   final String authType;

//   UserModel({
//     required this.authType,
//     required String email,
//   }) : super(
//           email: EmailAddress(email),
//           name: '',
//         );

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       email: json['email'] as String,
//       authType: json['authType'] as String,
//     );
//   }

//   SignInProviderUserAuthType getAuthType() {
//     switch (authType) {
//       case 'facebook':
//         return SignInProviderUserAuthType.facebook;
//       case 'google':
//         return SignInProviderUserAuthType.google;
//       case 'test':
//         return SignInProviderUserAuthType.test;
//       case 'email':
//       default:
//         return SignInProviderUserAuthType.email;
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['authType'] = authType;
//     data['email'] = email;
//     return data;
//   }
// }
