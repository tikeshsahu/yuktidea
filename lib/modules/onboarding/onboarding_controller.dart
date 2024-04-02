import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_snackbar.dart';
import 'package:yuktidea_assignment/routes/app_routes.dart';
import 'package:yuktidea_assignment/services/api/api_repository.dart';
import 'package:yuktidea_assignment/services/storage_service.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class OnboardingController extends GetxController {
  final RxList _countriesData = RxList([]);
  List get countriesData => _countriesData;

  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final RxInt _selectedCountryId = RxInt(0);
  int get selectedCountryId => _selectedCountryId.value;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  updateIsLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  updateSelectedCountryId(int value) {
    _selectedCountryId.value = value;
    update();
  }

  fetchCountries() async {
    updateIsLoading(true);
    try {
      final response = await ApiRepository.instance.getCountries();
      _countriesData.assignAll(response["data"]["countries"]);
      updateIsLoading(false);
    } catch (e) {
      if (kDebugMode) print(e);
      updateIsLoading(false);
    }
  }

  updateSelectedCountry(int countryId) async {
    updateIsLoading(true);
    try {
      var payload = {"country_id": countryId};
      final response = await ApiRepository.instance.updateCountry(payload);
      if (response["status"] == true) {
        CustomSnackBar.showSuccessSnackBar(
          title: AppConstants.success,
          message: "Country selected successfully",
        );
        Get.offAllNamed(AppRoutes.onboardingRoute);
      }
      updateIsLoading(false);
    } catch (e) {
      updateIsLoading(false);
    }
  }

  logout() async {
    try {
      await ApiRepository.instance.logout();
      StorageService.instance.clearAll();
      CustomSnackBar.showSuccessSnackBar(
        title: "Success",
        message: "You have been logged out successfully",
      );
      Get.offAllNamed(AppRoutes.startupRoute);
    } on DioException catch (e) {
      if (kDebugMode) print(e);
    }
  }

  deleteUser() async {
    try {
      await ApiRepository.instance.deleteUser();
      StorageService.instance.clearAll();
      Get.offAllNamed(AppRoutes.startupRoute);
    } on DioException catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
