import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dialog.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, this.phoneNumber, required this.isForgotPassScreen});
  final bool isForgotPassScreen;
  final dynamic phoneNumber;
  final defaultPinTheme = PinTheme(
    width: 60.w,
    height: 60.h,
    textStyle: GoogleFonts.poppins(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade200,
    ),
  );
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(OtpController());

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
              text: 'Enter OTP',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Gap(20),
            CustomRichtext(
              textAlign: TextAlign.center,
              primaryText:
                  'We have just sent you 4 digit code via your phone number ',
              secondaryText: phoneNumber,
              primeTextColor: AppColors.lightGrey,
            ),
            Gap(20),
            Form(
              key: _formKey,
              child: Pinput(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: _controller.otpController,
                length: 4,
                defaultPinTheme: defaultPinTheme.copyWith(
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    color: AppColors.primaryThemeColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xFFE3E3E9), width: 2),
                  ),
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primaryThemeColor,
                      width: 2,
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  textStyle: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryThemeColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primaryThemeColor,
                      width: 2,
                    ),
                  ),
                ),

                showCursor: true,
                onCompleted: (pin) {
                  debugPrint("Entered OTP: $pin");
                },
              ),
            ),
            Gap(50),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                isForgotPassScreen
                    ? Get.toNamed(AppRouteNames().createNewPass)
                    : showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: CustomDialog(
                            title: 'Successful',
                            subtitle:
                                'your account has been successfully registered.',
                            onTap: () => Get.toNamed(AppRouteNames().login),
                          ),
                        );
                      },
                    );
                _controller.otpController.clear();
              },
            ),
            Gap(20),
            CustomRichtext(
              primaryText: 'Didn’t receive code? ',
              secondaryText: 'Resend Code',
              primeTextColor: AppColors.lightGrey,
              primeFontSize: 16.sp,
              secFontSize: 16.sp,
              primeFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
