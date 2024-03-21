import 'package:get/get.dart';
import 'package:yuktidea_assignment/modules/auth/auth_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}