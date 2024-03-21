

import 'package:get/get.dart';
import 'package:yuktidea_assignment/modules/onboarding/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(), fenix: true);
  }
}