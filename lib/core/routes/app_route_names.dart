class AppRouteNames {
  AppRouteNames._internal();

  static final AppRouteNames _instance = AppRouteNames._internal();

  factory AppRouteNames() => _instance;

  final String splash = "/splash";
  final String onboarding = "/onboarding";
  final String chooseRole = "/chooseRole";
  final String register = "/register";
  final String login = "/login";
  final String otp = "/otp";
  final String forgotPass = "/forgotPass";
  final String createNewPass = "/createNewPass";
  final String allowLocation = "/allowLocation";
  final String manualLocation = "/manualLocation";
  final String editProfile = "/editProfile";
  final String support = "/support";
  final String privacyPolicy = "/privacyPolicy";
  final String spEditProfile = "/spEditProfile";
}
