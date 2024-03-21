import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_back_button.dart';
import 'package:yuktidea_assignment/modules/startup/startup_controller.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StartupController>();
    return Scaffold(
      backgroundColor: AppTheme.myColorScheme.secondary,
      body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimension.normalPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomBackButton(onPressed: () => Get.back()),
                  ],
                ),
                const SizedBox(height: AppDimension.normalPadding),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book, size: 80),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          "Terms & Conditions",
                          style: TextStyle(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Updated 16/03/2023",
                        ),
                      ],
                    ),
                  ],
                ),
                Html(
                  data: controller.termsData["content"],
                ),
              ],
            ),
          )),
    );
  }
}
