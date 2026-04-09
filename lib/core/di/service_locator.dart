import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

// Data
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecase/forgot_password_usecase.dart';
import '../../features/auth/domain/usecase/login_usecase.dart';
import '../../features/auth/domain/usecase/signup_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';

// Domain
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding.dart';

// Presentation
import '../../features/auth/presentation/cubit/verify_email_cubit.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../localization/locale_cubit.dart';
import '../services/firebase_auth_service.dart';
import '../theme/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Cubit
  sl.registerFactory(() => OnboardingCubit(sl()));
  sl.registerFactory(() => VerifyEmailCubit(sl()));

  //! UseCases
  sl.registerLazySingleton(() => CompleteOnboarding(sl()));

  //! Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  //! DataSources
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(),
  );


  sl.registerLazySingleton(() => LocaleCubit());
  sl.registerLazySingleton(() => ThemeCubit());

  // Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Firebase Service
  sl.registerLazySingleton(() => FirebaseService(sl(), sl()));

  // DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));

  // Cubit
  sl.registerLazySingleton(() => AuthCubit(sl(), sl(), sl()));
}