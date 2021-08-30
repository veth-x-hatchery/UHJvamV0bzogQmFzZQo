import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/authentication/domain/core/failures_details.dart';
import 'package:vethx_beta/features/authentication/domain/core/usecase.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';

class RequestLocalAuthorization implements UseCase<bool, NoParams> {
  final ILocalAuth _localAuth;

  RequestLocalAuthorization(this._localAuth);

  @override
  Future<Either<FailureDetails, bool>> call(NoParams params) =>
      _localAuth.request().then((result) {
        return result.fold(
          (l) => left(FailureDetails(
            message: 'MAP_ERROR_MESSAGE',
            failure: l,
          )),
          (r) => right(r),
        );
      });
}
