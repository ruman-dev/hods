import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:huds/core/app_assets/asset_path.dart';
import 'package:huds/core/app_colors/app_colors.dart';
import 'package:huds/core/wrapper/custom_poppins_text.dart';

class SliderModel extends StatelessWidget {
  const SliderModel({super.key, required this.image, required this.title, required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: TopRoundedClipper(),
              child: Container(height: MediaQuery.of(context).size.height * 0.6, color: Color(0xFFEAE6FD)),
            ),

            Positioned.fill(
              top: Get.width * 0.4,
              child: Column(
                children: [
                  SvgPicture.asset(AssetPath.appLogo, width: 105, height: 100),
                  Gap(Get.width * 0.05),
                  CustomPoppinsText(text: 'Hods', fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                ],
              ),
            ),
          ],
        ),

        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomPoppinsText(
            text: title,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGrey,
            textAlign: TextAlign.center,
          ),
        ),
        Gap(screenWidth * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomPoppinsText(
            text: description,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class TopRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
