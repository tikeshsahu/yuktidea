import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_snackbar.dart';
import 'package:yuktidea_assignment/routes/app_routes.dart';
import 'package:yuktidea_assignment/services/api/api_repository.dart';
import 'package:yuktidea_assignment/services/storage_service.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class AuthController extends GetxController {
  final RxList _loginCountries = RxList([]);
  List get loginCountriesList => _loginCountries;

  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final Rx<TextEditingController> _otpController = Rx(TextEditingController(text: ""));
  TextEditingController get otpController => _otpController.value;

  final Rx<TextEditingController> _mobileNumberController = Rx(TextEditingController());
  TextEditingController get mobileNumberController => _mobileNumberController.value;

  final RxBool _isOtpSent = RxBool(false);
  bool get isOtpSent => _isOtpSent.value;

  final RxBool _resendOtpActive = RxBool(false);
  bool get resendOtpActive => _resendOtpActive.value;

  final RxString _loginType = RxString("");
  String get loginType => _loginType.value;

  final RxString _selectedTeleCode = RxString("");
  String get selectedTeleCode => _selectedTeleCode.value;

  final RxString _selectedFlag = RxString("");
  String get selectedFlag => _selectedFlag.value;

  final Rx _authFormKey = Rx(GlobalKey<FormState>());
  GlobalKey<FormState> get authFormKey => _authFormKey.value;

  @override
  void onInit() {
    if (Get.arguments != null) {
      _loginType.value = Get.arguments["loginType"];
    }
    fetchLoginCountries();
    super.onInit();
  }

  @override
  void dispose() {
    _otpController.value.dispose();
    _mobileNumberController.value.dispose();
    super.dispose();
  }

  updateIsLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  updateResendOtpButton() {
    Future.delayed(const Duration(seconds: 30), () {
      _resendOtpActive.value = true;
      update();
    });
  }

  updateSelectedFlag(String value) {
    _selectedFlag.value = value;
  }

  updateSelectedTeleCode(String value) {
    _selectedTeleCode.value = value;
    Get.toNamed(AppRoutes.authRoute);
    update();
  }

  fetchLoginCountries() async {
    updateIsLoading(true);
    try {
      final response = await ApiRepository.instance.getLoginCountries();
      _loginCountries.assignAll(response["data"]);
      updateIsLoading(false);
    } catch (e) {
      CustomSnackBar.showErrorSnackBar(
        title: AppConstants.error,
        message: AppConstants.somethingWentWrong,
      );
      updateIsLoading(false);
    }
  }

  sendOtp() async {
    if (!authFormKey.currentState!.validate()) {
      return;
    }
    updateIsLoading(true);
    dynamic response;
    try {
      var payload = {
        "tel_code": selectedTeleCode,
        "phone": mobileNumberController.text,
      };
      if (loginType == "student") {
        response = await ApiRepository.instance.studentLogin(payload);
      } else {
        response = await ApiRepository.instance.counsellorLogin(payload);
      }
      if (response["status"] == true) {
        _isOtpSent.value = true;
        CustomSnackBar.showSuccessSnackBar(
          title: AppConstants.success,
          message: 'OTP sent successfully',
        );
        updateResendOtpButton();
      }
      updateIsLoading(false);
    } on DioException catch (e) {
      if (e.response!.data["status"] == false) {
        CustomSnackBar.showErrorSnackBar(
          title: AppConstants.error,
          message: e.response!.data["data"],
        );
      }
      updateIsLoading(false);
    }
  }

  verifyOtp() async {
    updateIsLoading(true);
    try {
      var payload = {
        "code": otpController.text,
        "phone": "$selectedTeleCode${mobileNumberController.text}",
      };
      final response = await ApiRepository.instance.verifyOtp(payload);

      if (response["status"] == true) {
        StorageService.instance.save(AppConstants.token, response["data"]["access_token"]);
        CustomSnackBar.showSuccessSnackBar(
          title: AppConstants.success,
          message: "OTP verified successfully",
        );
        if (response["data"]["profile_status"] == 'none') {
          Get.offAllNamed(AppRoutes.countriesRoute);
        } else {
          Get.offAllNamed(AppRoutes.onboardingRoute);
        }
      }
      updateIsLoading(false);
    } on DioException catch (e) {
      if (e.response!.data["status"] == false) {
        CustomSnackBar.showErrorSnackBar(
          title: AppConstants.error,
          message: e.response!.data["data"],
        );
      }
      updateIsLoading(false);
    }
  }

  resendOtp() async {
    updateIsLoading(true);
    try {
      var payload = {
        "phone": "$selectedTeleCode${mobileNumberController.text}",
      };
      dynamic response = await ApiRepository.instance.resendOtp(payload);

      if (response["status"] == true) {
        _isOtpSent.value = true;
        CustomSnackBar.showSuccessSnackBar(
          title: AppConstants.success,
          message: "OTP resent successfully",
        );
      }
      updateIsLoading(false);
    } on DioException catch (e) {
      if (e.response!.data["status"] == false) {
        CustomSnackBar.showErrorSnackBar(
          title: AppConstants.error,
          message: e.response!.data["data"],
        );
      }
      updateIsLoading(false);
    }
  }
}
