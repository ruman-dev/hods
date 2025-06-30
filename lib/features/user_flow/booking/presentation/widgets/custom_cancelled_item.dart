import 'package:huds/core/exports/exports.dart';

class CustomCancelledItem extends StatelessWidget {
  const CustomCancelledItem({
    super.key,
    this.imagePath,
    this.title,
    this.price,
    this.buttonText,
    this.onBtnTap,
    this.textBackgroundColor,
    this.textColor,
  });

  final String? imagePath;
  final String? title;
  final num? price;
  final String? buttonText;
  final void Function()? onBtnTap;
  final Color? textBackgroundColor;
  final Color? textColor;

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
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPoppinsText(
                  text: '10 Feb, 2025',
                  fontWeight: FontWeight.w600,
                ),
                Gap(5),
                CustomPoppinsText(text: 'The price is not reasonable.'),
              ],
            ),
          ),
          Divider(thickness: 1, color: Color(0xFFEEEEEE)),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomButton(
              text: buttonText ?? 'Cancel Service',
              width: Get.width * 0.35,
              height: 10,
              borderRadius: BorderRadius.circular(25),
              fontSize: 14,
              textColor: textColor,
              backgroundColor: textBackgroundColor,
              onPressed: onBtnTap ?? () {},
            ),
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
