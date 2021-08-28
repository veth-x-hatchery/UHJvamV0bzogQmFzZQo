import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';

import 'i_local_storage.service.dart';

class PII implements ILocalStorage<PersonallyIdentifiableInformation> {
  /// echo 'PIIKeys.*' | base64
  static const Map<PersonallyIdentifiableInformation, String> _piiKeys = {
    PersonallyIdentifiableInformation.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PersonallyIdentifiableInformation.userProfile:
        'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PersonallyIdentifiableInformation.credential: 'UElJS2V5cy5jcmVkZW50aWFsCg',
  };

  @override
  Future<Either<Failure, String>> get(
      {required PersonallyIdentifiableInformation key}) async {
    return right(_piiKeys[key]!);
  }

  @override
  Future<Either<Failure, Unit>> remove(
      {required PersonallyIdentifiableInformation key}) async {
    return const Left(Failure.cacheFailure());
  }

  @override
  Future<Either<Failure, Unit>> write(
      {required PersonallyIdentifiableInformation key,
      required String obj}) async {
    return const Left(Failure.cacheFailure());
  }
}
