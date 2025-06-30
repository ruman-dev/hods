import 'package:huds/core/exports/exports.dart';

class CustomSpServices extends StatelessWidget {
  const CustomSpServices({
    super.key,
    this.imagePath,
    this.title,
    this.price,
    this.buttonText,
    this.onBtnTap,
    this.backgroundColor,
    this.textColor,
    this.borderSide,
    this.fontSize,
    this.onUpdatePriceTap,
    required this.isCompletedService,
    required this.isCancelledService,
    this.onItemTap,
  });

  final String? imagePath;
  final String? title;
  final num? price;
  final String? buttonText;
  final void Function()? onBtnTap;
  final void Function()? onItemTap;
  final void Function()? onUpdatePriceTap;
  final Color? backgroundColor;
  final double? fontSize;
  final Color? textColor;
  final BorderSide? borderSide;

  final bool isCompletedService;
  final bool isCancelledService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 110.w,
                  height: 110.h,
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
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 5.h),
                      serviceInfo('Date: ', '26 Jan 2025'),
                      SizedBox(height: 10.h),
                      CustomPoppinsText(
                        text: '\$${price ?? 22.50.toStringAsFixed(2)}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryThemeColor,
                      ),
                      isCompletedService ? SizedBox.shrink() : Gap(5),
                      isCompletedService || isCancelledService
                          ? SizedBox.shrink()
                          : GestureDetector(
                            onTap: onUpdatePriceTap,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryThemeColor,
                              ),
                              child: CustomPoppinsText(
                                text: 'Update Price',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
            isCompletedService ? SizedBox.shrink() : Gap(10),
            isCompletedService
                ? SizedBox.shrink()
                : Divider(thickness: 1, color: Color(0xFFEEEEEE)),

            isCompletedService ? SizedBox.shrink() : SizedBox(height: 10.h),
            isCompletedService
                ? SizedBox.shrink()
                : isCancelledService
                ? Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      CustomPoppinsText(
                        text: '10 Jan, 2025',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomPoppinsText(
                        text: 'The price is not reasonable.',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                )
                : CustomButton(
                  text: buttonText ?? 'Cancel Service',
                  width: Get.width,
                  height: 15,
                  borderSide: borderSide ?? BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                  fontSize: fontSize ?? 16,
                  textColor: textColor,
                  backgroundColor: backgroundColor,
                  onPressed: onBtnTap ?? () {},
                ),
          ],
        ),
      ),
    );
  }

  Widget serviceInfo(String title, String data) {
    return Row(
      children: [
        CustomPoppinsText(
          text: '26 Jan, 2025',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGrey,
        ),
        isCancelledService
            ? SizedBox.shrink()
            : Row(
              children: [
                Gap(10),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Gap(10),
                Icon(Icons.star_rounded, color: Color(0xFFFFBD00)),
                CustomPoppinsText(
                  text: '4.3',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                ),
              ],
            ),
      ],
    );
  }
}
