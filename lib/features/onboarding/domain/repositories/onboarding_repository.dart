abstract class OnboardingRepository {
  Future<void> completeOnboarding();
  bool isFirstTime();
}