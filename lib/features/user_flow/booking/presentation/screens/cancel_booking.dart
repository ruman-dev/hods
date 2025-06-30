import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/utils/notification_service.dart';
import 'package:huds/features/user_flow/booking/presentation/controller/cancel_booking_controller.dart';
import 'package:huds/features/user_flow/booking/presentation/widgets/custom_textbox.dart';

class CancelBookingScreen extends StatelessWidget {
  CancelBookingScreen({super.key});

  final CancelBookingController controller = Get.put(CancelBookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Cancel Service'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPoppinsText(
              text: 'Please select the reason for cancellation:',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
            ),

            Divider(color: Color(0xFFEEEEEE), thickness: 1.w),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: controller.reasons.length,
              itemBuilder: (context, index) {
                return radioButton(index, controller.reasons[index]);
              },
            ),

            CustomPoppinsText(
              text: 'Others',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CustomTextbox(
              hint: 'Others reason...',
              controller: controller.reasonController,
              fontSize: 16,
            ),
            Spacer(),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: SpinKitCircle(
                      duration: Duration(seconds: 3),
                      size: 60,
                      color: AppColors.primaryThemeColor,
                    ),
                  ),
                );
              } else {
                return CustomButton(
                  text: 'Send',
                  width: double.maxFinite,
                  borderRadius: BorderRadius.circular(12.r),
                  onPressed: () {
                    if (controller.selectedIndex.value >= 0) {
                      // controller.isLoading.value = true;
                      // controller.cancelBookingProcess(
                      //   controller.selectedIndex.value,
                      // );
                      showCancelledDialog();
                    } else {
                      NotificationService.errorMessage(
                        'Please select an option',
                      );
                    }
                  },
                );
              }
            }),
            Gap(15),
          ],
        ),
      ),
    );
  }

  Widget radioButton(int index, [String? title]) {
    return Obx(
      () => RadioListTile(
        contentPadding: EdgeInsets.zero,
        title: CustomPoppinsText(
          text: title ?? 'Null',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGrey,
        ),
        activeColor: AppColors.primaryThemeColor,
        value: index,
        groupValue: controller.selectedIndex.value,
        onChanged: (value) {
          controller.selectedIndex.value = value!;
          debugPrint(controller.selectedIndex.toString());
        },
      ),
    );
  }

  Future showCancelledDialog() {
    return Get.dialog(
      transitionCurve: Curves.easeInQuad,
      transitionDuration: Duration(milliseconds: 200),
      AlertDialog(
        contentPadding: EdgeInsets.all(25),
        backgroundColor: Colors.white,
        content: SizedBox(
          height: Get.width * 0.6,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPoppinsText(
                text: 'Your order has been cancelled!',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryThemeColor,
                textAlign: TextAlign.center,
              ),
              Gap(10),
              CustomPoppinsText(
                text:
                    'We will continue to improve our service & satisfy you on the next order.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
                textAlign: TextAlign.center,
              ),
              Gap(Get.width * 0.05),
              CustomButton(
                text: 'OK',
                onPressed: () {
                  Get.back();
                  Get.back();
                  controller.selectedIndex.value = (-1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
