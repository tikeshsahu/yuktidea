import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/routes/app_pages.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Yuktidea',
      theme: AppTheme.darkTheme,
      initialRoute: AppUtils.checkUser(),
      getPages: AppPages.pages,
    );
  }
}
