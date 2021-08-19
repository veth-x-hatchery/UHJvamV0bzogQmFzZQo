// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vethx_beta/core/error/exceptions.dart';
// import 'package:vethx_beta/features/signin/infrastructure/models/user_model.dart';

// // ignore: constant_identifier_names
// const String CACHED_CURRENT_USER = 'CACHED_CURRENT_USER';

// abstract class ISignInLocalSource {
//   /// Throws [CacheException] if no cached data is present.
//   Future<UserModel> currentUser();

//   Future<void> cacheCurrentUser(UserModel user);

//   Future<void> signOut();
// }

// // class SignInLocalSource implements ISignInLocalSource {
// //   final SharedPreferences _sharedPreferences;

// //   SignInLocalSource(this._sharedPreferences);

// //   @override
// //   Future<void> cacheCurrentUser(UserModel user) {
// //     return _sharedPreferences.setString(
// //       CACHED_CURRENT_USER,
// //       json.encode(user.toJson()),
// //     );
// //   }

// //   @override
// //   Future<UserModel> currentUser() {
// //     final jsonString = _sharedPreferences.getString(CACHED_CURRENT_USER);
// //     if (jsonString == null) {
// //       throw CacheException();
// //     }
// //     return Future.value(
// //         UserModel.fromJson(json.decode(jsonString) as Map<String, dynamic>));
// //   }

// //   @override
// //   Future<void> signOut() {
// //     // TODO: implement signOut
// //     throw UnimplementedError();
// //   }
// // }
