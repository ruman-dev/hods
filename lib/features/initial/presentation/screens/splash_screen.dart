import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:huds/core/app_assets/asset_path.dart';
import 'package:huds/core/app_colors/app_colors.dart';
import 'package:huds/core/wrapper/custom_poppins_text.dart';
import 'package:huds/features/initial/presentation/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                children: [
                  SvgPicture.asset(AssetPath.appLogo, width: 105, height: 100),
                  Gap(Get.width * 0.05),
                  CustomPoppinsText(text: 'Hods', fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                ],
              ),
              Spacer(),
              Center(child: SpinKitCircle(color: AppColors.primaryThemeColor)),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
