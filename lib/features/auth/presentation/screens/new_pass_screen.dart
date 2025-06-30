import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dialog.dart';
import 'package:huds/features/auth/presentation/controller/new_pass_controller.dart';

class NewPassScreen extends StatelessWidget {
  NewPassScreen({super.key});

  final _controller = Get.put(NewPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: false,
        titleWidget: AppTitle(titleEnabled: true),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomPoppinsText(
              text: 'Create New Password',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            Gap(16),
            CustomPoppinsText(
              text: 'Create your new password',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              color: AppColors.lightGrey,
            ),
            Gap(Get.width * 0.1),
            Obx(
              () => CustomInputField(
                textController: _controller.passController,
                headerTitle: 'Password',
                hintText: 'Password',
                isObsecure: !_controller.isShowNewPass.value,
                prefixIcon: Icons.lock_outline_rounded,
                suffixWidget:
                    _controller.isShowNewPass.value
                        ? GestureDetector(
                          onTap: _controller.toggleNewPass,
                          child: Icon(
                            Icons.visibility_outlined,
                            color: AppColors.lightGrey,
                          ),
                        )
                        : GestureDetector(
                          onTap: _controller.toggleNewPass,
                          child: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.lightGrey,
                          ),
                        ),
              ),
            ),
            Gap(Get.width * 0.08),
            Obx(
              () => CustomInputField(
                headerTitle: 'Confirm Password',
                textController: _controller.confirmPassController,
                hintText: 'Confirm password',
                isObsecure: !_controller.isShowConfirmPass.value,
                prefixIcon: Icons.lock_outline_rounded,
                suffixWidget:
                    _controller.isShowConfirmPass.value
                        ? GestureDetector(
                          onTap: _controller.toggleConfirmPass,
                          child: Icon(
                            Icons.visibility_outlined,
                            color: AppColors.lightGrey,
                          ),
                        )
                        : GestureDetector(
                          onTap: _controller.toggleConfirmPass,
                          child: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.lightGrey,
                          ),
                        ),
              ),
            ),
            Gap(Get.width * 0.05),
            Spacer(),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: CustomDialog(
                        height: Get.width,
                        title: 'Successful',
                        subtitle:
                            'Your password has been successfully to your new password',
                        onTap: () {
                          Get.toNamed(AppRouteNames().login);
                          _controller.confirmPassController.clear();
                          _controller.confirmPassController.clear();
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
