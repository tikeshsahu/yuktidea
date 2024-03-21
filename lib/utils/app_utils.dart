import 'package:yuktidea_assignment/routes/app_routes.dart';
import 'package:yuktidea_assignment/services/storage_service.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class AppUtils {
  static String checkUser() {
      // return AppRoutes.countriesRoute;
    if (StorageService.instance.fetch(AppConstants.token) != null) {
      return AppRoutes.onboardingRoute;
    } else {
      return AppRoutes.startupRoute;
    }
  }
}
