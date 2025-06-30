import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/service_provider/nav_bar/sp_nav_bar.dart';
import 'package:huds/features/user_flow/nav_bar/nav_bar.dart';

class PaySuccessScreen extends StatelessWidget {
  const PaySuccessScreen({super.key, required this.isUser});

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(AssetPath.success),
              Gap(20),
              CustomPoppinsText(text: 'Congratulations!', fontSize: 24, fontWeight: FontWeight.w600),
              Gap(20),
              CustomPoppinsText(
                text: 'Your booking is successfully confirmed.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
              const Spacer(),
              CustomButton(text: 'Back to Home', onPressed: () => isUser ? Get.offAll(UserNavBar()) : Get.offAll(SpNavBar())),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
