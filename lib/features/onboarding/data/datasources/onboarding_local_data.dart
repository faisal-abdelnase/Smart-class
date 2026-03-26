import 'package:smart_class/core/utils/constants.dart';

import '../model/onboarding_model.dart';



class OnboardingData {
  static List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Learn Smart",
      description: "Study anytime anywhere",
      image: Constants.onboarding1,
    ),
    OnboardingModel(
      title: "Track Progress",
      description: "Monitor your learning journey",
      image: Constants.onboarding2,
    ),
    OnboardingModel(
      title: "Get Started",
      description: "Start your smart learning now",
      image: Constants.onboarding3,
    ),
  ];
}