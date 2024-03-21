import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class CustomSnackBar {
  static final TextTheme textTheme = Theme.of(Get.key.currentContext!).textTheme;

  static showGeneralSnackBar({title = "", message = "", position = SnackPosition.TOP}) {
    return Get.snackbar(
      "",
      "",
      snackPosition: position,
      borderRadius: 0,
      colorText: Colors.white,
      icon: const Icon(
        Icons.error_outline_outlined,
        color: Colors.white,
      ),
      isDismissible: true,
      shouldIconPulse: true,
      titleText: RichText(
        text: TextSpan(
          text: title,
          style: textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      messageText: RichText(
        text: TextSpan(
          text: message,
          style: textTheme.bodySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.only(
        top: AppDimension.normalPadding,
        bottom: AppDimension.normalPadding,
      ),
    );
  }

  static showSuccessSnackBar({title = "", message = "", position = SnackPosition.TOP}) {
    return Get.snackbar("", "",
        snackPosition: position,
        backgroundColor: const Color(0xFF343739),
        borderRadius: 12,
        isDismissible: true,
        titleText: RichText(
          text: TextSpan(
            text: title,
            style: textTheme.bodyMedium!.copyWith(
              color: const Color(0xFF0E9F6E),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        messageText: RichText(
          text: TextSpan(
            text: message,
            style: textTheme.bodySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15));
  }

  static showErrorSnackBar({title = "", message = "", position = SnackPosition.TOP}) {
    return Get.snackbar("", "",
        snackPosition: position,
        backgroundColor: const Color(0xFF343739),
        borderRadius: 12,
        shouldIconPulse: true,
        titleText: RichText(
          text: TextSpan(
            text: title,
            style: textTheme.bodyMedium!.copyWith(
              color: const Color(0xFFF05252),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        isDismissible: true,
        messageText: RichText(
          text: TextSpan(
            text: message,
            style: textTheme.bodySmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15));
  }
}
