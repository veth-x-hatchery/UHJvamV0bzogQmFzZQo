import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class ILocalAuth {
  // ignore: constant_identifier_names
  static const TOLERANCE_BETWEEN_REQUESTS = Duration(seconds: 3);

  /// Actually will INATIVATE app lifecycle state.
  /// And this will kill the BLoC that call it.
  /// When app returns from RESUME will get the last result
  /// [lastResultAvailable] and [cachedResult]
  Future<Either<AuthFailure, bool>> request({Duration? cacheTolerance});
}
