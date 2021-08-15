import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/features/signin/infrastructure/models/user_model.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';

abstract class ISignInRemoteSource {
  /// Throws a [ServerException] for all error codes.
  Future<bool> emailAlreadyRegistered(String email);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<void> passwordReset(String email);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithEmailAndPassword(String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithGoogle();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithFacebook();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> currentUser();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInAnonymously();

  /// Throws a [ServerException] for all error codes.
  Future<void> signOut();

  /// Throws a [ServerException] for all error codes.
  Future<Stream<User>> get onAuthStateChange;
}

class SignInRemoteSource implements ISignInRemoteSource {
  final http.Client _http;
  final API _api;

  SignInRemoteSource(this._http, this._api);

  @override
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> currentUser() async {
    final response = await _http.get(
      _api.endpointUri(Endpoint.signInCurrentUser),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw ServerException();
    }
  }

  @override
  // TODO: implement onAuthStateChange
  Future<Stream<User>> get onAuthStateChange => throw UnimplementedError();

  @override
  Future<void> passwordReset(String email) {
    // TODO: implement passwordReset
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> emailAlreadyRegistered(String email) async {
    final response = await _http.get(_api.endpointUri(
      Endpoint.checkEmail,
      queryParameters: <String, String>{'email': email},
    ));

    if (![
      HttpStatus.found,
      HttpStatus.notFound,
    ].contains(response.statusCode)) {
      throw ServerException();
    }

    return Future.value(response.statusCode == HttpStatus.found);
  }
}
