// import 'dart:convert';
// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:vethx_beta/core/api/api.dart';
// import 'package:vethx_beta/core/error/exceptions.dart';
// import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
// import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
// import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
// import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
// import 'package:vethx_beta/features/signin/infrastructure/models/user_model.dart';

// abstract class ISignInRemoteSource extends IAuthFacade {
//   /// Throws a [ServerException] for all error codes.
//   Future<bool> credentialAlreadyRegistered(String credential);

//   /// Throws a [ServerException] for all error codes.
//   Future<UserModel> signInWithEmailAndPassword(
//       String credential, String secret);

//   /// Throws a [ServerException] for all error codes.
//   Future<void> secretReset(String credential);

//   /// Throws a [ServerException] for all error codes.
//   Future<UserModel> signInWithFacebook();

//   /// Throws a [ServerException] for all error codes.
//   Future<UserModel> currentUser();

//   /// Throws a [ServerException] for all error codes.
//   Future<UserModel> signInAnonymously();

//   /// Throws a [ServerException] for all error codes.
//   @override
//   Future<void> signOut();
// }

// // class SignInRemoteSource implements ISignInRemoteSource {
// //   final http.Client _http;
// //   final API _api;

// //   SignInRemoteSource(this._http, this._api);

// //   @override
// //   Future<UserModel> signInWithEmailAndPassword(
// //       String credential, String secret) {
// //     // TODO: implement signInWithEmailAndPassword
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<UserModel> currentUser() async {
// //     final response = await _http.get(
// //       _api.endpointUri(Endpoint.signInCurrentUser),
// //       headers: {
// //         'Content-Type': 'application/json',
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       return UserModel.fromJson(
// //           json.decode(response.body) as Map<String, dynamic>);
// //     } else {
// //       throw ServerException();
// //     }
// //   }

// //   @override
// //   Future<void> secretReset(String credential) {
// //     // TODO: implement secretReset
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<UserModel> signInAnonymously() {
// //     // TODO: implement signInAnonymously
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<void> signOut() {
// //     // TODO: implement signOut
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<bool> credentialAlreadyRegistered(String credential) async {
// //     final response = await _http.get(_api.endpointUri(
// //       Endpoint.checkCredential,
// //       queryParameters: <String, String>{'credential': credential},
// //     ));

// //     if (![
// //       HttpStatus.found,
// //       HttpStatus.notFound,
// //     ].contains(response.statusCode)) {
// //       throw ServerException();
// //     }

// //     return Future.value(response.statusCode == HttpStatus.found);
// //   }

// //   @override
// //   Future<Either<AuthFailure, bool>> credentialIsAlreadyInUse(
// //       CredentialAddress credentialAddress) {
// //     // TODO: implement credentialIsAlreadyInUse
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<AuthFailure, Unit>> registerWithCredentialAndPassword(
// //       {required CredentialAddress credentialAddress, required Password secret}) {
// //     // TODO: implement registerWithCredentialAndPassword
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<AuthFailure, Unit>> signInWithCredentialAndPassword(
// //       {required CredentialAddress credentialAddress, required Password secret}) {
// //     // TODO: implement signInWithCredentialAndPassword
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<UserModel> signInWithFacebook() {
// //     // TODO: implement signInWithFacebook
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<AuthFailure, Unit>> signInWithGoogle() {
// //     // TODO: implement signInWithGoogle
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<User?> getSignedInUser() {
// //     // TODO: implement getSignedInUser
// //     throw UnimplementedError();
// //   }
// // }
