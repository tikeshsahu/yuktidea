

import 'package:get/get.dart';
import 'package:yuktidea_assignment/modules/startup/startup_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartupController(), fenix: true);
  }
}