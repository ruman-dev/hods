import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dialog.dart';
import 'package:huds/features/user_flow/nav_bar/nav_bar.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: false,
        titleWidget: AppTitle(titleEnabled: true),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CustomPoppinsText(
                text: 'Face Recognition',
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              Gap(10),
              CustomPoppinsText(
                text:
                    'Add a face recognition to make your account more secure.',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SvgPicture.asset(AssetPath.face),
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
                          title: 'Congratulations!',
                          subtitle:
                              'Your account is ready to use. You will be redirected to the home page in a few seconds',
                          imagePath: AssetPath.successBack,
                          titleFontSize: 20,
                          subtitleFontSize: 14,
                          onTap: () => Get.offAll(UserNavBar()),
                        ),
                      );
                    },
                  );
                },
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
