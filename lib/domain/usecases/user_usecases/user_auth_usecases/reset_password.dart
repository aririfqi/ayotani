import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/repositories/user_auth_repository.dart';

class ResetPassword {
  final UserAuthRepository _repository;

  ResetPassword(this._repository);

  Future<Either<Failure, void>> execute(String email) {
    return _repository.resetPassword(email);
  }
}
