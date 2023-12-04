import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/repositories/repositories.dart';

class UploadProfilePicture {
  final UserStorageRepository _repository;

  UploadProfilePicture(this._repository);

  Future<Either<Failure, String>> execute(String path, String name) {
    return _repository.uploadProfilePicture(path, name);
  }
}
