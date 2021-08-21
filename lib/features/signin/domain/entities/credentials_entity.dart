import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

class Credentials {
  final CredentialAddress user;
  final Password secret;
  Credentials({
    required this.user,
    required this.secret,
  });
}
