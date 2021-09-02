// import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
// import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

// enum SignInProviderUserAuthType {
//   facebook,
//   google,
//   credential,
//   test,
// }

// class UserModel extends User {
//   final String authType;

//   UserModel({
//     required this.authType,
//     required String credential,
//   }) : super(
//           credential: CredentialAddress(credential),
//           name: '',
//         );

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       credential: json['credential'] as String,
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
//       case 'credential':
//       default:
//         return SignInProviderUserAuthType.credential;
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['authType'] = authType;
//     data['credential'] = credential;
//     return data;
//   }
// }
