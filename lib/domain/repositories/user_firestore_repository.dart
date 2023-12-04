import 'package:dartz/dartz.dart';
import 'package:ayotani/common/utils/failure.dart';
import 'package:ayotani/domain/entities/user_data_entity.dart';

abstract class UserFirestoreRepository {
  /*
  * User Data Firestore Repository
  */
  Future<Either<Failure, void>> createUserData(UserDataEntity userData);

  Future<Either<Failure, UserDataEntity>> readUserData(String uid);

  Future<Either<Failure, void>> updateUserData(UserDataEntity userData);

  Future<Either<Failure, bool>> isNewUser(String uid);
}
