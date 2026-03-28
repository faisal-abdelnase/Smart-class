

import '../../../../core/services/hive_services.dart';

abstract class OnboardingLocalDataSource {
  Future<void> setFirstTimeFalse();
  bool isFirstTime();
}

class OnboardingLocalDataSourceImpl
    implements OnboardingLocalDataSource {

  @override
  Future<void> setFirstTimeFalse() async {
    await HiveService.box.put('firstTime', false);
  }

  @override
  bool isFirstTime() {
    return HiveService.box.get('firstTime', defaultValue: true);
  }
}