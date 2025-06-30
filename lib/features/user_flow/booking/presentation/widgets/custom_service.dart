import 'package:huds/core/exports/exports.dart';

class CustomService extends StatelessWidget {
  const CustomService({
    super.key,
    this.imagePath,
    this.title,
    this.price,
    this.onFirstBtnTap,
    this.firstButtonText,
    this.secondButtonText,
    this.onSecondBtnTap,
  });

  final String? imagePath;
  final String? title;
  final num? price;
  final String? firstButtonText;
  final String? secondButtonText;
  final void Function()? onFirstBtnTap;
  final void Function()? onSecondBtnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Colors.black12),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imagePath ??
                          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/b10b5991b843ec63e1a4d31c30a76120f9e3426b',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPoppinsText(
                      text: title ?? 'Pipe Master Plumbing',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 5.h),
                    serviceInfo('Date: ', '26 Jan 2025'),
                    SizedBox(height: 10.h),
                    CustomPoppinsText(
                      text: '\$${price ?? 150.0}',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryThemeColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 1, color: Color(0xFFEEEEEE)),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: firstButtonText ?? '',
                  width: Get.width * 0.35,
                  height: 10,
                  borderRadius: BorderRadius.circular(25),
                  fontSize: 14,
                  backgroundColor: Colors.white,
                  textColor: AppColors.darkGrey,
                  borderSide: BorderSide(color: AppColors.darkGrey, width: 1.5),
                  onPressed: onFirstBtnTap ?? () {},
                ),
              ),
              Gap(20),
              Expanded(
                child: CustomButton(
                  text: secondButtonText ?? '',
                  width: Get.width * 0.35,
                  height: 10,
                  borderRadius: BorderRadius.circular(25),
                  fontSize: 14,
                  onPressed: onSecondBtnTap ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget serviceInfo(String title, String data) {
    return CustomRichtext(
      primaryText: '$title ',
      secondaryText: data,
      primeFontSize: 12.sp,
      primeFontWeight: FontWeight.w500,
      secFontSize: 12.sp,
      secFontWeight: FontWeight.w500,
      secTextColor: AppColors.lightGrey,
    );
  }
}
