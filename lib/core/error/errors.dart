import 'package:vethx_beta/features/signin/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final String valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
