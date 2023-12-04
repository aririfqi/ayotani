import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_data_entity.dart';
import 'package:ayotani/domain/repositories/user_firestore_repository.dart';

class ReadUserData {
  final UserFirestoreRepository _repository;

  ReadUserData(this._repository);

  Future<Either<Failure, UserDataEntity>> execute(String uid) {
    return _repository.readUserData(uid);
  }
}
