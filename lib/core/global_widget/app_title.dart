import '../exports/exports.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    this.fontSize,
    this.logoWidth,
    required this.titleEnabled,
    this.titleText,
  });

  final double? fontSize;
  final double? logoWidth;
  final bool titleEnabled;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: CircleAvatar(
            backgroundColor: Color(0xFFECEFF3),
            child: Icon(Icons.arrow_back),
          ),
        ),
        titleEnabled ? Spacer() : SizedBox.shrink(),
        titleEnabled
            ? Row(
              children: [
                titleText == null
                    ? SvgPicture.asset(
                      AssetPath.appLogo,
                      width: logoWidth ?? Get.width * 0.07,
                      fit: BoxFit.cover,
                    )
                    : SizedBox.shrink(),
                Gap(10),
                CustomPoppinsText(
                  text: titleText ?? 'HODS',
                  fontSize: fontSize ?? 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey,
                ),
                Gap(Get.width * 0.1),
              ],
            )
            : SizedBox.shrink(),
        Spacer(),
      ],
    );
  }
}
