import 'package:equatable/equatable.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class FailureDetails extends Equatable {
  final MessageFromLocations message;
  final AuthFailure failure;

  const FailureDetails({
    required this.message,
    required this.failure,
  });

  @override
  List<Object> get props => [failure];

  @override
  bool get stringify => false;
}

extension FailureDetailsX on FailureDetails {
  String? l10nFromMessage(AppLocalizations? _) => message.call(_);
}
