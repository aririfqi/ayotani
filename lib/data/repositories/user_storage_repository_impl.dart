import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/exception.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/data/datasources/datasources.dart';
import 'package:ayotani/domain/repositories/repositories.dart';

class UserStorageRepositoryImpl implements UserStorageRepository {
  final UserStorageDataSource userStorageDataSource;

  UserStorageRepositoryImpl({required this.userStorageDataSource});

  @override
  Future<Either<Failure, String>> uploadProfilePicture(
    String path,
    String name,
  ) async {
    try {
      final result =
          await userStorageDataSource.uploadProfilePicture(path, name);

      return Right(result.toString());
    } on StorageException {
      return const Left(StorageFailure('Oops, terjadi kesalahan'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfilePicture(String filename) async {
    try {
      final result = await userStorageDataSource.deleteProfilePicture(filename);

      return Right(result);
    } on StorageException {
      return const Left(StorageFailure('Oops, terjadi kesalahan'));
    }
  }
}
