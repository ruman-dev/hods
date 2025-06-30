import '../exports/exports.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title,
    this.subtitle,
    required this.onTap,
    this.titleFontSize,
    this.subtitleFontSize,
    this.height,
    this.imagePath,
  });

  final double? height;
  final String? title;
  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final String? imagePath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.maxFinite,
      height: height ?? Get.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath ?? AssetPath.helpIcon,
            width: 120,
            height: 120,
          ),
          Gap(30),
          CustomPoppinsText(
            text: title ?? '',
            fontSize: titleFontSize ?? 32,
            fontWeight: FontWeight.w600,
          ),
          Gap(16),
          CustomPoppinsText(
            text: subtitle ?? '',
            textAlign: TextAlign.center,
            fontSize: subtitleFontSize ?? 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
          Gap(25),
          CustomButton(text: 'Continue', onPressed: onTap),
        ],
      ),
    );
  }
}
