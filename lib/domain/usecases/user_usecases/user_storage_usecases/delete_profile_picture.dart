import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/repositories/repositories.dart';

class DeleteProfilePicture {
  final UserStorageRepository _repository;

  DeleteProfilePicture(this._repository);

  Future<Either<Failure, void>> execute(String filename) {
    return _repository.deleteProfilePicture(filename);
  }
}
