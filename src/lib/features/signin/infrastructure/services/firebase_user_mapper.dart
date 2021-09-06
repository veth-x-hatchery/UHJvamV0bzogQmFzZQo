import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:hatchery/features/signin/domain/entities/user_entity.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';

class FirebaseUserMapper {
  User? toDomain(firebase.User? _) {
    return _ == null
        ? null
        : User(
            name: _.displayName ??
                (_.email == null ? 'Not found' : _.email!.split('@').first),
            credential: Credential(_.email ?? 'notfound@notfound.com'),
          );
  }
}
