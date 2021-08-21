import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';

class SignInRepository implements ISignInRepository {
  static const genericErrorMessage = 'Cache problem';

  final INetworkInfo _networkInfo;
  final ISignInLocalSource _localDataSource;

  SignInRepository(this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, void>> cacheCredential(Credential credential) async {
    try {
      await _localDataSource.cacheCredential(credential);
      return const Right(null);
    } on CacheException {
      return const Left(Failure.cacheFailure(message: genericErrorMessage));
    }
  }

  @override
  Future<Either<Failure, Credential>> cachedCredential() async {
    try {
      final result = await _localDataSource.cachedCredential();
      return Right(result);
    } on CacheException {
      return const Left(Failure.cacheFailure(message: genericErrorMessage));
    }
  }
}
