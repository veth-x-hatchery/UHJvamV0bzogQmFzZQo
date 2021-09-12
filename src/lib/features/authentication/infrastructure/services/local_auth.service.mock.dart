import 'package:dartz/dartz.dart';
import 'package:hatchery/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:hatchery/features/authentication/infrastructure/services/local_auth_failure.dart';

class LocalAuthMock implements ILocalAuth {
  @override
  Future<Either<LocalAuthFailure, bool>> request({
    Duration? cacheTolerance,
    bool ignoreCacheAndForceRequest = false,
  }) async {
    return right(true);
  }
}
