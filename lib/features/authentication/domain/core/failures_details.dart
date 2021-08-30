import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

part 'failures_details.freezed.dart';

@freezed
class FailureDetails with _$FailureDetails {
  factory FailureDetails({
    required String message,
    required LocalAuthFailure failure,
  }) = _FailureDetails;
}
