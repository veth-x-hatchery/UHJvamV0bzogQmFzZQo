import 'package:dartz/dartz.dart';
import 'package:hatchery/core/error/exceptions.dart';
import 'package:hatchery/core/services/storage/i_local_storage.service.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';

abstract class ISignInLocalSource {
  /// Throws [CacheException] when transaction fail.
  Future<void> cacheCredential(Credential credential);

  /// Throws [CacheException] if no cached data is present.
  Future<Credential> cachedCredential();
}

class SignInLocalSource implements ISignInLocalSource {
  final ILocalStorage<PersonallyIdentifiableInformationKeys> _cacheService;

  SignInLocalSource(this._cacheService);

  @override
  Future<void> cacheCredential(Credential credential) async {
    final result = await _cacheService.write(
      key: PersonallyIdentifiableInformationKeys.credential,
      obj: credential.getOrCrash(),
    );
    return result.fold(
      (l) => throw CacheException(),
      (r) => unit,
    );
  }

  @override
  Future<Credential> cachedCredential() async {
    final result = await _cacheService.get(
        key: PersonallyIdentifiableInformationKeys.credential);
    return result.fold(
      (l) => throw CacheException(),
      (value) => Credential(value),
    );
  }
}
