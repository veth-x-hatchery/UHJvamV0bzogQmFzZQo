// import 'package:dartz/dartz.dart';
// import 'package:vethx_beta/core/error/exceptions.dart';
// import 'package:vethx_beta/core/error/failures.dart';
// import 'package:vethx_beta/core/network/network_info.dart';
// import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
// // import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
// import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_remote_data_source.dart';

// class SignInRepositoryDefaultMessages {
//   static const error = '';
// }

// // typedef Future<User> _userFromDataSource();

// class SignInRepository implements ISignInRepository {
//   final INetworkInfo _networkInfo;
//   final ISignInLocalSource _localDataSource;
//   final ISignInRemoteSource _remoteDataSource;

//   SignInRepository(
//     this._remoteDataSource,
//     this._localDataSource,
//     this._networkInfo,
//   );

//   @override
//   Future<Either<Failure, User>> currentUser() async {
//     if (await _networkInfo.isConnected) {
//       try {
//         /// get current user on Firebase service and UPDATE the local storage
//         final user = await _remoteDataSource.currentUser();
//         await _localDataSource.cacheCurrentUser(user);
//         return Right(user);
//       } on ServerException {
//         return const Left(
//             Failure.serverFailure(message: SignInRepositoryDefaultMessages.error));
//       }
//     } else {
//       try {
//         final local = await _localDataSource.currentUser();
//         return Right(local);
//       } on CacheException {
//         // ignore: prefer_const_constructors
//         return Left(
//           const Failure.cacheFailure(message: SignInRepositoryDefaultMessages.error),
//         );
//       }
//     }
//   }

//   @override
//   Future<Either<Failure, Stream<User>>> get onAuthStateChange =>
//       throw UnimplementedError();

//   @override
//   Future<Either<Failure, void>> signOut() {
//     // TODO: implement signOut
//     throw UnimplementedError();
//   }
// }
