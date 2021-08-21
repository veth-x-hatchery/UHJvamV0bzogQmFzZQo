import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

class Credentials {
  final Credential user;
  final Secret secret;
  Credentials({
    required this.user,
    required this.secret,
  });
}
