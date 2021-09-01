import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/l10n/l10n.dart';

part 'failures_details.freezed.dart';

@freezed
class FailureDetails with _$FailureDetails {
  factory FailureDetails({
    required dynamic message,
    required AuthFailure failure,
  }) = _FailureDetails;
}

extension FailureDetailsX on FailureDetails {
  String? l10nFromMessage(AppLocalizations? _) =>
      (message as MessageFromLocations).call(_);
}
