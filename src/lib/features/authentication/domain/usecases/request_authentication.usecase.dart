import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class RequestLocalAuthentication implements UseCase<bool, NoParams> {
  final ILocalAuth _localAuth;

  RequestLocalAuthentication(this._localAuth);

  @override
  Future<Either<FailureDetails<LocalAuthFailure>, bool>> call(
          NoParams params) =>
      _localAuth.request().then((result) {
        return result.fold(
          (l) => left(_mapFailures(l)),
          (r) => right(r),
        );
      });

  FailureDetails<LocalAuthFailure> _mapFailures(LocalAuthFailure auth) {
    return auth.map(
      genericError: (_) => FailureDetails(
        failure: auth,
        message: RequestLocalAuthenticationErrorMessages.genericError(),
      ),
      notAvailable: (_) => FailureDetails(
        failure: auth,
        message: RequestLocalAuthenticationErrorMessages.unavailable(),
      ),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class RequestLocalAuthenticationErrorMessages {
  static MessageFromLocalizations unavailable() => (appLocalizations) =>
      appLocalizations?.comum_error_message ?? 'comum_error_message';

  static MessageFromLocalizations genericError() => (appLocalizations) =>
      appLocalizations?.comum_error_message ?? 'comum_error_message';
}
