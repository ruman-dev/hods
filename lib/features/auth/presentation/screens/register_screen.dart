import 'package:huds/core/exports/exports.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _controller = Get.put(RegisterController());

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
                CustomPoppinsText(
                  text: 'Create Account',
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                CustomPoppinsText(
                  text: 'Create your account to explore Hods',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                Gap(20),
                CustomInputField(
                  headerTitle: 'Name',
                  textController: _controller.nameController,
                  hintText: 'Enter your name',
                  prefixIcon: Icons.account_circle_outlined,
                  keyboardType: TextInputType.name,
                ),
                Gap(20),
                CustomInputField(
                  headerTitle: 'Phone',
                  textController: _controller.phoneController,
                  hintText: 'Enter your phone',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                Gap(20),
                CustomInputField(
                  headerTitle: 'Email',
                  textController: _controller.emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap(20),
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
                              child: Icon(
                                Icons.visibility_outlined,
                                color: AppColors.lightGrey,
                              ),
                            )
                            : GestureDetector(
                              onTap: _controller.togglePasswordVisibility,
                              child: Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.lightGrey,
                              ),
                            ),
                  ),
                ),
                Gap(20),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        activeColor: AppColors.primaryThemeColor,
                        value: _controller.isChecked.value,
                        onChanged: (value) {
                          _controller.isChecked.value = value!;
                        },
                      ),
                    ),
                    Gap(8),
                    Expanded(
                      child: CustomRichtext(
                        primaryText: 'Yes, I understand and agree to the ',
                        secondaryText: 'Terms of Service.',
                        secTextColor: AppColors.primaryThemeColor,
                        primeTextColor: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
                Gap(Get.width * 0.05),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Get.to(
                      OtpScreen(
                        phoneNumber: _controller.phoneController.text,
                        isForgotPassScreen: false,
                      ),
                    );

                    _controller.emailController.clear();
                    _controller.nameController.clear();
                    _controller.phoneController.clear();
                    _controller.passController.clear();
                  },
                ),
                Gap(Get.width * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xFFA4ACB9), thickness: 2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomPoppinsText(
                        text: 'Or Sign up with',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA4ACB9),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFFA4ACB9), thickness: 2),
                    ),
                  ],
                ),
                Gap(Get.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(
                        AssetPath.google,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(20),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(
                        AssetPath.facebook,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(20),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 232, 240, 245),
                      child: SvgPicture.asset(
                        AssetPath.apple,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Align(
                  alignment: Alignment.center,
                  child: CustomRichtext(
                    primaryText: 'Already have an account? ',
                    secondaryText: 'Login',
                    onSecPressed: () {
                      Get.toNamed(AppRouteNames().login);
                      _controller.emailController.clear();
                      _controller.nameController.clear();
                      _controller.phoneController.clear();
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
