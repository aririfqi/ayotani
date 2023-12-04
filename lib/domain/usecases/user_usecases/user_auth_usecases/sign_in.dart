import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_entity.dart';
import 'package:ayotani/domain/repositories/user_auth_repository.dart';

class SignIn {
  final UserAuthRepository _repository;

  SignIn(this._repository);

  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return _repository.signIn(email, password);
  }
}
