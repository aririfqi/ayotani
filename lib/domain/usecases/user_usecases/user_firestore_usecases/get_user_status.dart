import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/repositories/user_firestore_repository.dart';

class GetUserStatus {
  final UserFirestoreRepository _repository;

  GetUserStatus(this._repository);

  Future<Either<Failure, bool>> execute(String uid) {
    return _repository.isNewUser(uid);
  }
}
