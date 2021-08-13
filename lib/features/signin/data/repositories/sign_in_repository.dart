import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/exceptions.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/network/network_info.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

// typedef Future<User> _userFromDataSource();

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
  Future<Either<Failure, User>> currentUser() async {
    if (await _networkInfo.isConnected) {
      try {
        /// get current user on Firebase service and UPDATE the local storage
        final user = await _remoteDataSource.currentUser();
        await _localDataSource.cacheCurrentUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await _localDataSource.currentUser();
        return Right(local);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
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
