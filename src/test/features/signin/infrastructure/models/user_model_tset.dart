// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:hatchery/features/signin/infrastructure/models/user_model.dart';

// import '../../../../fixtures/fixture_reader.dart';

// void main() {
//   final user = UserModel(authType: 'google', credential: 'test@vethx.com');

//   group('fromJson', () {
//     test(
//       'should return a valid model when the JSON user is auth type from google',
//       () async {
//         // arrange
//         final jsonMap = json.decode(fixture('sign_in_user_google.json'))
//             as Map<String, dynamic>;
//         // act
//         final result = UserModel.fromJson(jsonMap);
//         // assert
//         expect(result, user);
//       },
//     );
//   });
// }
