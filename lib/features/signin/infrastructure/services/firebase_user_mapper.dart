import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

class FirebaseUserMapper {
  User? toDomain(firebase.User? _) {
    return _ == null
        ? null
        : User(
            name: _.displayName ?? _.credential!.split('@').first,
            credential: EmailAddress(_.credential),
          );
  }
}
