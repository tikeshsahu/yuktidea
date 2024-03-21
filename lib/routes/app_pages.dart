import 'package:get/get.dart';
import 'package:yuktidea_assignment/modules/auth/widgets/login_countries.dart';
import 'package:yuktidea_assignment/modules/onboarding/onboarding_binding.dart';
import 'package:yuktidea_assignment/modules/onboarding/onboarding_screen.dart';
import 'package:yuktidea_assignment/modules/onboarding/widgets/select_country.dart';
import 'package:yuktidea_assignment/modules/startup/startup_screen.dart';
import 'package:yuktidea_assignment/modules/startup/widgets/terms_conditions.dart';
import 'package:yuktidea_assignment/routes/app_routes.dart';
import '../modules/auth/auth_binding.dart';
import '../modules/auth/auth_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.startupRoute,
      page: () => const StartupScreen(),
    ),
    GetPage(
      name: AppRoutes.termsAndConditionsRoute,
      page: () => const TermsConditions(),
    ),
    GetPage(name: AppRoutes.authRoute, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(name: AppRoutes.loginCountryRoute, page: () => const LoginCountries()),
    GetPage(name: AppRoutes.countriesRoute, page: () => const SelectCountry()),
    GetPage(name: AppRoutes.onboardingRoute, page: () => const OnboardingScreen(), binding: OnboardingBinding()),
  ];
}
