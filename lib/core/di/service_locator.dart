import 'package:get_it/get_it.dart';

// Data
import '../../features/onboarding/data/datasources/onboarding_local_data_source.dart';
import '../../features/onboarding/data/repositories/onboarding_repository_impl.dart';

// Domain
import '../../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../../features/onboarding/domain/usecases/complete_onboarding.dart';

// Presentation
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../localization/locale_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Cubit
  sl.registerFactory(() => OnboardingCubit(sl()));

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
}