import 'package:vethx_login/features/signin/data/models/user_model.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';

abstract class ISignInLocalSource {
  /// Throws [CacheException] if no cached data is present.
  Future<UserModel> currentUser();

  Future<void> signOut();

  Future<Stream<User>> get onAuthStateChange;
}
