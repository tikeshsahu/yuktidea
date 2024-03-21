import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_button.dart';
import 'package:yuktidea_assignment/modules/auth/auth_controller.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppTheme.myColorScheme.secondary,
      body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            child: Obx(
              () => controller.isLoading
                  ? SizedBox(height: size.height, width: size.width, child: const Center(child: CircularProgressIndicator()))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: AppDimension.largePadding * 2),
                        Obx(
                          () => controller.isOtpSent
                              ? Text(
                                  "Verify Number",
                                  style: textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Enter phone number",
                                  style: textTheme.bodyLarge,
                                ),
                        ),
                        const SizedBox(height: AppDimension.largePadding),
                        Obx(
                          () => !controller.isOtpSent
                              ? Text(
                                  "Please enter your 10 digit mobile\nnumber to receive OTP",
                                  style: textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Please enter the OTP received to\nverify your number",
                                  style: textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        const SizedBox(height: AppDimension.largePadding),
                        Container(
                          width: size.width,
                          height: 3.0,
                          decoration: const BoxDecoration(gradient: AppTheme.dividerColour),
                        ),
                        const SizedBox(height: AppDimension.largePadding * 2),
                        Obx(
                          () => !controller.isOtpSent
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: AppDimension.normalPadding * 2),
                                      child: Form(
                                        key: controller.authFormKey,
                                        child: TextFormField(
                                          controller: controller.mobileNumberController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            enabled: controller.isOtpSent ? false : true,
                                            hintText: "99999 99999",
                                            hintStyle: textTheme.labelMedium!.copyWith(color: Colors.grey),
                                            prefix: Text(controller.selectedTeleCode),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                              child: SizedBox(
                                                height: 22,
                                                width: 34,
                                                child: SvgPicture.network(
                                                  controller.selectedFlag,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            contentPadding: const EdgeInsets.all(AppDimension.normalPadding),
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                            border: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return "Please enter your mobile number";
                                            }
                                            if (!value.isPhoneNumber) {
                                              return "Please enter a valid mobile number";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: AppDimension.largePadding * 5),
                                  ],
                                )
                              : Column(children: [
                                  Pinput(
                                    controller: controller.otpController,
                                    closeKeyboardWhenCompleted: true,
                                    enabled: true,
                                    length: 4,
                                    cursor: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 9),
                                          width: 22,
                                          height: 1,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    defaultPinTheme: PinTheme(
                                      width: size.width * 0.14,
                                      height: size.height * 0.065,
                                      decoration: BoxDecoration(
                                        border: const Border.symmetric(
                                          horizontal: BorderSide(color: Colors.grey),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.length != 4) {
                                        return "Please enter 4 digit OTP";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: AppDimension.largePadding * 4,
                                  ),
                                  Text("Didn't receive OTP?", style: textTheme.bodySmall!.copyWith(color: Colors.grey)),
                                  const SizedBox(
                                    height: AppDimension.normalPadding * 2,
                                  ),
                                  Obx(
                                    () => TextButton(
                                        onPressed: () {
                                          if (controller.resendOtpActive) {
                                            controller.resendOtp();
                                          } else {}
                                        },
                                        child: Text("Resend Otp",
                                            style: textTheme.bodyMedium!.copyWith(
                                              color: controller.resendOtpActive ? const Color(0xFFD9896A) : Colors.grey,
                                              fontWeight: controller.resendOtpActive ? FontWeight.bold : FontWeight.normal,
                                            ))),
                                  ),
                                ]),
                        ),
                        const SizedBox(height: AppDimension.largePadding * 2),
                        SizedBox(
                            width: size.width * 0.5,
                            height: size.height * 0.07,
                            child: CustomElevatedButton(
                              onPressed: () async {
                                if (controller.isOtpSent) {
                                  await controller.verifyOtp();
                                } else {
                                  await controller.sendOtp();
                                }
                              },
                              child: Obx(
                                () => Text(controller.isOtpSent ? "Verify" : "Get OTP", style: textTheme.labelMedium),
                              ),
                            )),
                      ],
                    ),
            ),
          )),
    );
  }
}
