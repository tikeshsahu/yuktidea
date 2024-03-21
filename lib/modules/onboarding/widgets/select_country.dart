import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_back_button.dart';
import 'package:yuktidea_assignment/custom_widgets/custom_button.dart';
import 'package:yuktidea_assignment/modules/onboarding/onboarding_controller.dart';
import 'package:yuktidea_assignment/themes/app_theme.dart';
import 'package:yuktidea_assignment/utils/app_dimensions.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final OnboardingController obController = Get.put(OnboardingController());
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
                  "Select Country",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: AppDimension.normalPadding),
                Text(
                  "Please select the country where\nyou want to study",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: AppDimension.largePadding),
                Container(
                  width: size.width,
                  height: 3.0,
                  decoration: const BoxDecoration(gradient: AppTheme.dividerColour),
                ),
                const SizedBox(height: AppDimension.largePadding),
                GetBuilder<OnboardingController>(builder: (controller) {
                  return controller.isLoading
                      ? SizedBox(height: size.height, width: size.width, child: const Center(child: CircularProgressIndicator()))
                      : SizedBox(
                          height: size.height * 0.42,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: obController.countriesData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var data = obController.countriesData[index];
                              return GestureDetector(
                                onTap: () {
                                  obController.updateSelectedCountryId(data["id"]);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: size.width * 0.3,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: ColorFiltered(
                                            colorFilter: controller.selectedCountryId == data["id"]
                                                ? const ColorFilter.mode(Colors.transparent, BlendMode.color) // Apply color filter for selected item
                                                : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                                            child: Image.network(
                                              data["image"] ?? "",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )),
                                    const SizedBox(height: AppDimension.normalPadding),
                                    Text(data["name"] ?? "",
                                        style: textTheme.bodySmall!.copyWith(
                                          fontWeight: controller.selectedCountryId == data["id"] ? FontWeight.bold : FontWeight.w400,
                                          fontSize: controller.selectedCountryId == data["id"] ? 16 : 14,
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                }),
                const SizedBox(height: AppDimension.normalPadding * 2),
                SizedBox(
                  width: size.width * 0.6,
                  height: size.height * 0.07,
                  child: CustomElevatedButton(
                    onPressed: () {
                      obController.updateSelectedCountry(obController.selectedCountryId);
                    },
                    child: Text("Proceed", style: textTheme.labelMedium),
                  ),
                ),
                const SizedBox(height: AppDimension.largePadding),
                Text(
                  "Can't see the country of  your interest?",
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: AppDimension.normalPadding),
                Text(
                  "Consult with us",
                  style: textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
              ],
            ),
          )),
    );
  }
}
