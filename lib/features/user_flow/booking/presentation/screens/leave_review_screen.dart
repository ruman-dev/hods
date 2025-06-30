import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/booking/presentation/controller/leave_review_controller.dart';
import 'package:huds/features/user_flow/booking/presentation/widgets/custom_textbox.dart';

class LeaveReviewScreen extends StatelessWidget {
  LeaveReviewScreen({super.key});

  final _reviewController = Get.put(LeaveReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Leave Review')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomPoppinsText(
                text: 'How was the experience?',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              Gap(20),
              CustomPoppinsText(
                text:
                    'share your experience, so next time we can suggest you even better',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: AppColors.lightGrey,
              ),
              Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'Rating',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _reviewController.selectedIndex.value = index + 1;
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              _reviewController.selectedIndex.value <
                                      (index + 1)
                                  ? Color(0xFFf5f5fc)
                                  : AppColors.primaryThemeColor,
                          radius: 22.r,
                          child: Icon(
                            Icons.star_rounded,
                            size: 28.r,
                            color:
                                _reviewController.selectedIndex.value <
                                        (index + 1)
                                    ? Color(0xFFAEADB7)
                                    : Color(0xFFFFC72C),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Gap(30),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'Write comment',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(15),
              CustomTextbox(
                hint: 'Please share your experience with us.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Gap(Get.width * 0.8),
              CustomButton(text: 'Submit', onPressed: () => Get.back()),
            ],
          ),
        ),
      ),
    );
  }
}
