import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

class Credentials {
  final EmailAddress user;
  final Password password;
  Credentials({required this.user, required this.password});
}
