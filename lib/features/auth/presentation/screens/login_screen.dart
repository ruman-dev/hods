import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/auth/presentation/controller/login_controller.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPoppinsText(text: 'Welcome!', fontSize: 26, fontWeight: FontWeight.w500),
                CustomPoppinsText(
                  text: 'Sign in to your account',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                Gap(Get.width * 0.1),
                CustomInputField(
                  headerTitle: 'Email',
                  textController: _controller.emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap(Get.width * 0.05),
                Obx(
                  () => CustomInputField(
                    headerTitle: 'Password',
                    textController: _controller.passController,
                    hintText: 'Enter your password',
                    isObsecure: !_controller.isPassVisible.value,
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixWidget:
                        _controller.isPassVisible.value
                            ? GestureDetector(
                              onTap: _controller.togglePasswordVisibility,
                              child: Icon(Icons.visibility_outlined, color: AppColors.lightGrey),
                            )
                            : GestureDetector(
                              onTap: _controller.togglePasswordVisibility,
                              child: Icon(Icons.visibility_off_outlined, color: AppColors.lightGrey),
                            ),
                  ),
                ),
                Gap(Get.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            activeColor: AppColors.primaryThemeColor,
                            value: _controller.isChecked.value,
                            onChanged: (value) {
                              _controller.isChecked.value = !_controller.isChecked.value;
                            },
                          ),
                        ),
                        CustomPoppinsText(
                          text: 'Remember Me',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGrey,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouteNames().forgotPass);
                        _controller.emailController.clear();
                        _controller.passController.clear();
                      },
                      child: CustomPoppinsText(
                        text: 'Forgot Password?',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryThemeColor,
                      ),
                    ),
                  ],
                ),
                Gap(Get.width * 0.05),
                CustomButton(
                  text: 'Login with email',
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    if (_controller.emailController.text == 'service_provider@gmail.com') {
                      prefs.setBool('isUser', false);
                      debugPrint('Role : ${prefs.getBool('isUser')}');
                    } else {
                      prefs.setBool('isUser', true);
                    }

                    Get.offAllNamed(AppRouteNames().allowLocation);
                    _controller.emailController.clear();
                    _controller.passController.clear();
                  },
                ),
                Gap(Get.width * 0.05),
                CustomButton(
                  text: 'Login with Face ID',
                  backgroundColor: Colors.white,
                  textColor: AppColors.primaryThemeColor,
                  borderSide: BorderSide(color: AppColors.primaryThemeColor),
                  onPressed: () async {
                    // Check if device supports biometrics
                    await _controller.checkBiometrics();
                    await _controller.getAvailableBiometrics();

                    if (_controller.canCheckBiometrics != true ||
                        !_controller.availableBiometrics!.contains(BiometricType.face)) {
                      Get.snackbar('Error', 'Face ID not available on this device', snackPosition: SnackPosition.BOTTOM);
                      return;
                    }

                    final authenticated = await _controller.authenticateWithBiometrics();
                    if (authenticated) {
                      // Proceed with login
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Done'))); // or your home route
                    }
                  },
                ),

                Gap(Get.width * 0.1),
                Row(
                  children: [
                    Expanded(child: Divider(color: Color(0xFFA4ACB9), thickness: 2)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomPoppinsText(
                        text: 'Or Sign up with',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA4ACB9),
                      ),
                    ),
                    Expanded(child: Divider(color: Color(0xFFA4ACB9), thickness: 2)),
                  ],
                ),
                Gap(Get.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(AssetPath.google, width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    Gap(Get.width * 0.05),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(AssetPath.facebook, width: 40, height: 40, fit: BoxFit.cover),
                    ),
                    Gap(Get.width * 0.05),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(AssetPath.apple, width: 40, height: 40, fit: BoxFit.cover),
                    ),
                  ],
                ),
                Gap(Get.width * 0.05),
                Align(
                  alignment: Alignment.center,
                  child: CustomRichtext(
                    primaryText: 'Don’t have an account? ',
                    secondaryText: 'Register',
                    onSecPressed: () {
                      Get.offAllNamed(AppRouteNames().register);
                      _controller.emailController.clear();
                      _controller.passController.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
