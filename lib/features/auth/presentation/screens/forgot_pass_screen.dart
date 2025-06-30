import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/auth/presentation/controller/forgot_pass_controller.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});
  final _controller = Get.put(ForgotPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: false,
        titleWidget: AppTitle(titleEnabled: true),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            CustomPoppinsText(
              text: 'Reset Your Password',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            Gap(16),
            CustomPoppinsText(
              text:
                  'Please enter your email and we will send an OTP code in the next step to reset your password',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
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
            Spacer(),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                Get.to(OtpScreen(isForgotPassScreen: true));
                _controller.emailController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
