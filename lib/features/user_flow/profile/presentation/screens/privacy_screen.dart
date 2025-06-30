import 'package:huds/core/exports/exports.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Privacy Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPoppinsText(
                text: 'Privacy Policy',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text:
                    'Your privacy is important to us. This policy outlines how we collect, use, and protect your information when using Hods Home Service app.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              SizedBox(height: 20.h),
              CustomPoppinsText(
                text: 'How We Use Your Information',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text:
                    '1. We collect your details information to give you better service from our end. We believe, customer satisfaction our top priority.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text:
                    '2. When you make a payment, we collect payment details such as master card information securely.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text:
                    '3. We may collect your name, email, and phone  number for account creation and communication.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              SizedBox(height: 20.h),
              CustomPoppinsText(
                text: 'Contact Us',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text:
                    'If you have any questions about this Privacy Policy, please contact us at: \nEmail: support@hodss.com',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
