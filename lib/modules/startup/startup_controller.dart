import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_snackbar.dart';
import 'package:yuktidea_assignment/routes/app_routes.dart';
import 'package:yuktidea_assignment/services/api/api_repository.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class StartupController extends GetxController {
  final RxMap _termsData = RxMap({});
  Map get termsData => _termsData;

  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final RxString _loginType = RxString("");
  String get loginType => _loginType.value;

  @override
  void onInit() {
    fetchTermsAndConditions();
    super.onInit();
  }

  updateIsLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  updateLoginType(String loginType) {
    _loginType.value = loginType;
    Get.toNamed(AppRoutes.loginCountryRoute, arguments: {"loginType": loginType});
  }

  fetchTermsAndConditions() async {
    updateIsLoading(true);
    try {
      final response = await ApiRepository.instance.getTermsAndConditions();
      _termsData.assignAll(response["data"]);
      updateIsLoading(false);
    } catch (e) {
      updateIsLoading(false);
      CustomSnackBar.showErrorSnackBar(
        title: AppConstants.error,
        message: AppConstants.somethingWentWrong,
      );
    }
  }
}
