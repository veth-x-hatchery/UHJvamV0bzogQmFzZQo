import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';

class SignInRepositoryDefaultMessages {
  static const error = '';
}

// typedef Future<User> _userFromDataSource();

class SignInRepository implements ISignInRepository {
  final INetworkInfo _networkInfo;
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
        return Left(
            ServerFailure(message: SignInRepositoryDefaultMessages.error));
      }
    } else {
      try {
        final local = await _localDataSource.currentUser();
        return Right(local);
      } on CacheException {
        return Left(
            CacheFailure(message: SignInRepositoryDefaultMessages.error));
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

  @override
  Future<Either<Failure, bool>> emailAlreadyRegistered(String email) async {
    if (!await _networkInfo.isConnected) {
      return Left(
          ServerFailure(message: SignInRepositoryDefaultMessages.error));
    }
    try {
      return Right(await _remoteDataSource.emailAlreadyRegistered(email));
    } on ServerException {
      return Left(
          ServerFailure(message: SignInRepositoryDefaultMessages.error));
    }
  }
}
