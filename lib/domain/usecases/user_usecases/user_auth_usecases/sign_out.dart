import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/repositories/user_auth_repository.dart';

class SignOut {
  final UserAuthRepository _repository;

  SignOut(this._repository);

  Future<Either<Failure, void>> execute() {
    return _repository.signOut();
  }
}
