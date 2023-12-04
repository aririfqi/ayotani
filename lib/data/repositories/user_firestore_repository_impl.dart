import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/exception.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/data/datasources/user_datasources/user_firestore_data_source.dart';
import 'package:ayotani/data/models/user_models/user_data_model.dart';
import 'package:ayotani/domain/entities/user_data_entity.dart';
import 'package:ayotani/domain/repositories/user_firestore_repository.dart';

class UserFirestoreRepositoryImpl implements UserFirestoreRepository {
  final UserFirestoreDataSource userFirestoreDataSource;

  UserFirestoreRepositoryImpl({required this.userFirestoreDataSource});

  /*
  * User Data Firestore Repository Implements
  */
  @override
  Future<Either<Failure, void>> createUserData(UserDataEntity userData) async {
    try {
      final userDataModel = UserDataModel.fromEntity(userData);

      final result =
          await userFirestoreDataSource.createUserData(userDataModel);

      return Right(result);
    } on FirestoreException {
      return const Left(FirestoreFailure('Oops, terjadi kesalahan'));
    }
  }

  @override
  Future<Either<Failure, UserDataEntity>> readUserData(String uid) async {
    try {
      final result = await userFirestoreDataSource.readUserData(uid);

      return Right(result.toEntity());
    } on FirestoreException {
      return const Left(FirestoreFailure('Oops, terjadi kesalahan'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserData(UserDataEntity userData) async {
    try {
      final userDataModel = UserDataModel.fromEntity(userData);

      final result =
          await userFirestoreDataSource.updateUserData(userDataModel);

      return Right(result);
    } on FirestoreException {
      return const Left(FirestoreFailure('Oops, terjadi kesalahan'));
    }
  }

  @override
  Future<Either<Failure, bool>> isNewUser(String uid) async {
    try {
      final result = await userFirestoreDataSource.isNewUser(uid);

      return Right(result);
    } on FirestoreException {
      return const Left(FirestoreFailure('Oops, terjadi kesalahan'));
    }
  }
}
