import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_back_button.dart';
import 'package:yuktidea_assignment/modules/auth/auth_controller.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class LoginCountries extends StatelessWidget {
  const LoginCountries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AuthController authController = Get.put(AuthController());
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [CustomBackButton(onPressed: () => Get.back())],
                ),
                const SizedBox(height: AppDimension.normalPadding),
                Text(
                  "Select your country",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: AppDimension.normalPadding),
                SizedBox(
                  width: size.width / 1.2,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, color: Colors.orange),
                      filled: true,
                      fillColor: const Color(0xFF4B4E4F),
                      contentPadding: const EdgeInsets.symmetric(vertical: -22.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimension.normalPadding),
                Container(
                  width: size.width,
                  height: 3.0,
                  decoration: const BoxDecoration(gradient: AppTheme.dividerColour),
                ),
                GetBuilder<AuthController>(builder: (controller) {
                  return controller.isLoading
                      ? SizedBox(height: size.height, width: size.width, child: const Center(child: CircularProgressIndicator()))
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.loginCountriesList.length,
                          itemBuilder: (context, index) {
                            var data = controller.loginCountriesList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: GestureDetector(
                                onTap: () {
                                  authController.updateSelectedFlag(data["flag"]);
                                  authController.updateSelectedTeleCode(data["tel_code"]);
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 34,
                                    child: SvgPicture.network(
                                      data["flag"] ?? "",
                                      height: 22,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  title: Text(
                                    data["name"] ?? "",
                                    style: textTheme.bodySmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                  trailing: Text(
                                    data["tel_code"] ?? "",
                                    style: textTheme.bodySmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Container(
                            width: size.width,
                            height: 3.0,
                            decoration: const BoxDecoration(gradient: AppTheme.dividerColour),
                          ),
                        );
                }),
              ],
            ),
          )),
    );
  }
}
