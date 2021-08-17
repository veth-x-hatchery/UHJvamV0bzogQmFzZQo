import 'package:equatable/equatable.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

class User extends Equatable {
  final EmailAddress email;
  final String name;

  const User({
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [email];
}
