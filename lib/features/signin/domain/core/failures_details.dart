import 'package:equatable/equatable.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

class FailureDetails extends Equatable {
  final String message;
  final AuthFailure failure;

  const FailureDetails({
    required this.message,
    required this.failure,
  });

  @override
  List<Object> get props => [failure, message];

  @override
  bool get stringify => false;
}
