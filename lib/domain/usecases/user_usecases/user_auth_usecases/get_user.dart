import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_entity.dart';
import 'package:ayotani/domain/repositories/user_auth_repository.dart';

class GetUser {
  final UserAuthRepository _repository;

  GetUser(this._repository);

  Either<Failure, Stream<UserEntity?>> execute() {
    return _repository.getUser();
  }
}
