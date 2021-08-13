import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/usecases/usecase.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

class SignInWithEmailAndPassword extends UseCase<User, Params> {
  final ISignInRepository _signInRepository;

  SignInWithEmailAndPassword(this._signInRepository);

  @override
  Future<Either<Failure, User>> call(Params params) {
    return _signInRepository.signInWithEmailAndPassword(params.credentials);
  }
}

class Params extends Equatable {
  final Credentials credentials;

  const Params({required this.credentials});

  @override
  List<Object?> get props => [
        credentials.user,
        credentials.password,
      ];
}
