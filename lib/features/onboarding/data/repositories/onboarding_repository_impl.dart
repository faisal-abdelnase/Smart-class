import '../datasources/onboarding_local_data_source.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource local;

  OnboardingRepositoryImpl(this.local);

  @override
  Future<void> completeOnboarding() async {
    await local.setFirstTimeFalse();
  }

  @override
  bool isFirstTime() {
    return local.isFirstTime();
  }
}