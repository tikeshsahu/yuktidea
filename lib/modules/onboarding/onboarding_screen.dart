import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_button.dart';
import 'package:yuktidea_assignment/modules/onboarding/onboarding_controller.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.myColorScheme.secondary,
      body: SafeArea(
          top: true,
          bottom: true,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: AppDimension.largePadding * 1.5),
                SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.07,
                  child: CustomElevatedButton(
                    onPressed: () => controller.logout(),
                    child: Text("Logout", style: textTheme.labelMedium),
                  ),
                ),
                const SizedBox(height: AppDimension.normalPadding * 2),
                SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.07,
                  child: CustomElevatedButton(
                    onPressed: () {
                      controller.deleteUser();
                    },
                    child: Text("Delete User", style: textTheme.labelMedium),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
