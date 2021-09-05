import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

abstract class ILocalAuth {
  // ignore: constant_identifier_names
  static const TOLERANCE_BETWEEN_REQUESTS = Duration(seconds: 10);
  // ignore: constant_identifier_names
  static const STORAGE_KEY = 'YnZhb3NkZmFkbnN2YVtzMGFmc2RmW2Fpb3NkbmEK';

  /// Actually will INATIVATE app lifecycle state.
  /// And this will kill the BLoC that call it.
  /// When app returns from RESUME will get the last result
  /// [lastResultAvailable] and [cachedResult]
  Future<Either<LocalAuthFailure, bool>> request({
    Duration? cacheTolerance,
    bool ignoreCacheAndForceRequest = false,
  });
}
