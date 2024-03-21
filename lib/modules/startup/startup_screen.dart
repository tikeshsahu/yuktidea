import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_snackbar.dart';
import 'package:yuktidea_assignment/modules/startup/startup_controller.dart';
import 'package:yuktidea_assignment/routes/app_routes.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final StartupController controller = Get.put(StartupController());
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.myColorScheme.secondary,
      body: SafeArea(
          top: true,
          bottom: true,
          child: Stack(children: [
            SizedBox(
              height: size.height * 0.85,
              width: size.width,
              child: Image.asset(
                "assets/images/startup_gif.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.39,
                decoration: BoxDecoration(
                  color: AppTheme.myColorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimension.normalPadding),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Study Lancer",
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppDimension.normalPadding),
                      Text(
                        "Please select your role to get registered",
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(height: AppDimension.normalPadding),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => controller.updateLoginType("student"),
                                child: Container(
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-3, -3),
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                      ),
                                      const BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(3, 3),
                                        blurRadius: 8,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    "assets/images/startup_student.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimension.normalPadding / 2),
                              Text(
                                "Student",
                                style: textTheme.bodySmall,
                              )
                            ],
                          )),
                          const SizedBox(width: AppDimension.normalPadding),
                          Expanded(
                              child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => controller.updateLoginType("counseller"),
                                child: Container(
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-3, -3),
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                      ),
                                      const BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(3, 3),
                                        blurRadius: 8,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    "assets/images/startup_agent.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppDimension.normalPadding / 2),
                              Text(
                                "Agent",
                                style: textTheme.bodySmall,
                              )
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(height: AppDimension.normalPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By continuing you agree to our ",
                            style: textTheme.bodySmall!.copyWith(fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.termsAndConditionsRoute),
                            child: Text(
                              "Terms & Conditions",
                              style: textTheme.bodyMedium!.copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
