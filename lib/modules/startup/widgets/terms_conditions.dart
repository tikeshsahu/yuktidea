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
    final TextTheme textTheme = Theme.of(context).textTheme;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 55,
                      height: 65,
                      child: Stack(
                        children: [
                          Container(
                              width: 47,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFFD9896A),
                              )),
                          Positioned(
                            top: 6,
                            left: 6,
                            child: Container(
                              width: 47,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF945439),
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000).withOpacity(0.5),
                                    offset: const Offset(-3, -3),
                                    blurRadius: 6,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 3,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 4,
                                      width: 17,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 4,
                                      width: 27,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 3,
                                      width: 17,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppDimension.largePadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Terms & Conditions",
                          style: textTheme.bodyMedium!.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Text("Updated 16/03/2023", style: textTheme.bodySmall!.copyWith(fontSize: 14, color: const Color(0xFF7D7E80))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppDimension.largePadding),
                Html(
                  data: controller.termsData["content"],
                  style: {
                    "h1": Style(
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize(16),
                      color: const Color(0xFFD9896A),
                    ),
                    "p": Style(
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize(14),
                      color: Colors.white,
                    ),
                    "li": Style(
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize(13),
                      color: Colors.white,
                    ),
                  },
                ),
              ],
            ),
          )),
    );
  }
}
