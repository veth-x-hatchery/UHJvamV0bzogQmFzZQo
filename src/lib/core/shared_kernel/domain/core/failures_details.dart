import 'package:equatable/equatable.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class FailureDetails<F> extends Equatable {
  final MessageFromLocalizations message;
  final F failure;

  const FailureDetails({
    required this.message,
    required this.failure,
  });

  @override
  List<Object> get props => [
        F,
        message.overridedHash,
      ];

  @override
  bool get stringify => false;
}
