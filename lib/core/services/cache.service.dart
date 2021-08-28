import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';

import 'i_local_storage.service.dart';

class CacheService implements ILocalStorage<SensitiveData> {
  /// echo 'CacheKeys.*' | base64
  static const Map<SensitiveData, String> _cacheKeys = {
    SensitiveData.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
  };

  @override
  Future<Either<Failure, String>> get({required SensitiveData key}) async {
    return Right(_cacheKeys[key]!);
  }

  @override
  Future<Either<Failure, Unit>> remove({required SensitiveData key}) async {
    return const Left(Failure.cacheFailure());
  }

  @override
  Future<Either<Failure, Unit>> write(
      {required SensitiveData key, required String obj}) async {
    return const Left(Failure.cacheFailure());
  }
}
