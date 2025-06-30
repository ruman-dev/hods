import '../exports/exports.dart';

class CustomDialog2 extends StatelessWidget {
  const CustomDialog2({
    super.key,
    this.title,
    this.subtitle,
    this.titleFontSize,
    this.subtitleFontSize,
    this.height,
    required this.onFirstBtnTap,
    required this.onSecondBtnTap,
  });

  final double? height;
  final String? title;
  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final void Function() onFirstBtnTap;
  final void Function() onSecondBtnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.maxFinite,
      height: height ?? Get.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetPath.helpIcon, width: 100, height: 100),
          Gap(30),
          CustomPoppinsText(
            text: title ?? '',
            fontSize: titleFontSize ?? 32,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Gap(16),
          CustomPoppinsText(
            text: subtitle ?? '',
            textAlign: TextAlign.center,
            fontSize: subtitleFontSize ?? 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Gap(25),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Log out',
                  borderSide: BorderSide(color: AppColors.darkGrey, width: 1.5),
                  textColor: AppColors.darkGrey,
                  backgroundColor: Colors.white,
                  onPressed: onFirstBtnTap,
                ),
              ),
              Gap(15),
              Expanded(
                child: CustomButton(text: 'Cancel', onPressed: onSecondBtnTap),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
