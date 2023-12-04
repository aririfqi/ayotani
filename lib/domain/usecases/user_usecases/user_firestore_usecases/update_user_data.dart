import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_data_entity.dart';
import 'package:ayotani/domain/repositories/user_firestore_repository.dart';

class UpdateUserData {
  final UserFirestoreRepository _repository;

  UpdateUserData(this._repository);

  Future<Either<Failure, void>> execute(UserDataEntity userData) {
    return _repository.updateUserData(userData);
  }
}
