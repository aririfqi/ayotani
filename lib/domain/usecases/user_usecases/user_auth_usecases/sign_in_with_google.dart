import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_entity.dart';
import 'package:ayotani/domain/repositories/user_auth_repository.dart';

class SignInWithGoogle {
  final UserAuthRepository _repository;

  SignInWithGoogle(this._repository);

  Future<Either<Failure, UserEntity?>> execute() {
    return _repository.signInWithGoogle();
  }
}
