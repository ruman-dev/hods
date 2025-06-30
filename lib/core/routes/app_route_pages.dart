import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huds/core/routes/app_route_names.dart';
import 'package:huds/features/auth/presentation/screens/forgot_pass_screen.dart';
import 'package:huds/features/auth/presentation/screens/login_screen.dart';
import 'package:huds/features/auth/presentation/screens/choose_role_screen.dart';
import 'package:huds/features/auth/presentation/screens/new_pass_screen.dart';
import 'package:huds/features/auth/presentation/screens/register_screen.dart';
import 'package:huds/features/initial/presentation/screens/onboarding_screen.dart';
import 'package:huds/features/initial/presentation/screens/splash_screen.dart';
import 'package:huds/features/service_provider/profile/presentation/screens/sp_edit_profile_screen.dart';
import 'package:huds/features/setup_profile/presentation/screens/allow_location_screen.dart';
import 'package:huds/features/setup_profile/presentation/screens/manual_location_screen.dart';
import 'package:huds/features/user_flow/profile/presentation/screens/edit_profile_screen.dart';
import 'package:huds/features/user_flow/profile/presentation/screens/privacy_screen.dart';
import 'package:huds/features/user_flow/profile/presentation/screens/support_screen.dart';

class AppRoutePages {
  static List<GetPage<dynamic>> appRoutePages() {
    return [
      _getPage(name: AppRouteNames().splash, page: SplashScreen()),
      _getPage(name: AppRouteNames().onboarding, page: OnboardingScreen()),
      _getPage(name: AppRouteNames().chooseRole, page: ChooseRoleScreen()),
      _getPage(name: AppRouteNames().register, page: RegisterScreen()),
      _getPage(name: AppRouteNames().login, page: LoginScreen()),
      _getPage(name: AppRouteNames().forgotPass, page: ForgotPassScreen()),
      _getPage(name: AppRouteNames().createNewPass, page: NewPassScreen()),
      _getPage(name: AppRouteNames().editProfile, page: EditProfileScreen()),
      _getPage(name: AppRouteNames().support, page: SupportScreen()),
      _getPage(name: AppRouteNames().privacyPolicy, page: PrivacyScreen()),
      _getPage(
        name: AppRouteNames().spEditProfile,
        page: SpEditProfileScreen(),
      ),
      _getPage(
        name: AppRouteNames().manualLocation,
        page: ManualLocationScreen(),
      ),
      _getPage(
        name: AppRouteNames().allowLocation,
        page: AllowLocationScreen(),
      ),
    ];
  }

  static GetPage<dynamic> _getPage({
    required String name,
    required Widget page,
  }) => GetPage(name: name, page: () => page);
}
