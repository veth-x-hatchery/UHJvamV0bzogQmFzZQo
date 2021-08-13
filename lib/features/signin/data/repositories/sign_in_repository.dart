import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/network/network_info.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

class SignInRepository implements ISignInRepository {
  final NetworkInfo _networkInfo;
  final ISignInLocalSource _localDataSource;
  final ISignInRemoteSource _remoteDataSource;

  SignInRepository(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, User>> createUserWithEmailAndPassword(
      Credentials credentials) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement onAuthStateChange
  Future<Either<Failure, Stream<User>>> get onAuthStateChange =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, void>> passwordReset(Credentials credentials) {
    // TODO: implement passwordReset
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      Credentials credentials) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
