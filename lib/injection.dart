import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'common/utils/http_ssl_pinning.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repositories.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/providers/providers.dart';

final locator = GetIt.instance;

void init() {
  /*
  * Provider section
  */

  // User auth providers
  locator.registerFactory(
    () => UserAuthNotifier(
      signInUseCase: locator(),
      signInWithGoogleUseCase: locator(),
      signUpUseCase: locator(),
      resetPasswordUseCase: locator(),
      signOutUseCase: locator(),
    ),
  );
  locator.registerFactory(
    () => GetUserNotifier(getUserUseCase: locator()),
  );

  // User firestore providers
  locator.registerFactory(
    () => UserDataNotifier(
      createUserDataUseCase: locator(),
      readUserDataUseCase: locator(),
      updateUserDataUseCase: locator(),
      getUserStatusUseCase: locator(),
    ),
  );

  // User storage providers
  locator.registerFactory(
    () => UserStorageNotifier(
      uploadProfilePictureUseCase: locator(),
      deleteProfilePictureUseCase: locator(),
    ),
  );

  // Home Page Provider

  /*
  * Use cases section
  */

  // User auth usecases
  locator.registerLazySingleton(() => GetUser(locator()));
  locator.registerLazySingleton(() => SignIn(locator()));
  locator.registerLazySingleton(() => SignInWithGoogle(locator()));
  locator.registerLazySingleton(() => SignUp(locator()));
  locator.registerLazySingleton(() => SignOut(locator()));
  locator.registerLazySingleton(() => ResetPassword(locator()));

  // User firestore usecases
  locator.registerLazySingleton(() => CreateUserData(locator()));
  locator.registerLazySingleton(() => ReadUserData(locator()));
  locator.registerLazySingleton(() => UpdateUserData(locator()));
  locator.registerLazySingleton(() => GetUserStatus(locator()));

  // User storage usecases
  locator.registerLazySingleton(() => UploadProfilePicture(locator()));
  locator.registerLazySingleton(() => DeleteProfilePicture(locator()));

  // News usecases

  /*
  * Repositories section
  */

  // User repositories
  locator.registerLazySingleton<UserAuthRepository>(
    () => UserAuthRepositoryImpl(userAuthDataSource: locator()),
  );
  locator.registerLazySingleton<UserFirestoreRepository>(
    () => UserFirestoreRepositoryImpl(userFirestoreDataSource: locator()),
  );
  locator.registerLazySingleton<UserStorageRepository>(
    () => UserStorageRepositoryImpl(userStorageDataSource: locator()),
  );

  /*
  * Data sources section
  */

  // User data sources
  locator.registerLazySingleton<UserAuthDataSource>(
    () => UserAuthDataSourceImpl(
      firebaseAuth: locator(),
      googleSignIn: locator(),
    ),
  );
  locator.registerLazySingleton<UserFirestoreDataSource>(
    () => UserFirestoreDataSourceImpl(firebaseFirestore: locator()),
  );
  locator.registerLazySingleton<UserStorageDataSource>(
    () => UserStorageDataSourceImpl(firebaseStorage: locator()),
  );

  /*
  * Common services section
  */

  // Services
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => FirebaseStorage.instance);
  locator.registerLazySingleton(() => GoogleSignIn());

  // client w/ SSL pinning certified
  locator.registerLazySingleton(() => HttpSslPinning.client);
}
