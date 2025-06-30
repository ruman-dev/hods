import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dialog.dart';
import 'package:huds/core/global_widget/custom_dropdown_2.dart';
import 'package:huds/features/service_provider/nav_bar/sp_nav_bar.dart';
import 'package:huds/features/service_provider/setup_profile/presentation/controller/sp_setup_availibility_controller.dart';

class SpSetupAvailibilityScreen extends StatelessWidget {
  SpSetupAvailibilityScreen({super.key});

  final _availableController = Get.put(SpSetupAvailibilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Complete Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.schedule_outlined),
                Gap(12),
                CustomPoppinsText(
                  text: 'Select Your Availability',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),

            Gap(20),
            availableTime(
              dayTitle: 'Monday',
              isChecked: _availableController.dayTitle1,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 0),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Tuesday',
              isChecked: _availableController.dayTitle2,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 1),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Wednesday',
              isChecked: _availableController.dayTitle3,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 2),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Thursday',
              isChecked: _availableController.dayTitle4,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 3),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Friday',
              isChecked: _availableController.dayTitle5,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 4),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Saturday',
              isChecked: _availableController.dayTitle6,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 5),
            ),
            Gap(20),
            availableTime(
              dayTitle: 'Sunday',
              isChecked: _availableController.dayTitle7,
              onChanged:
                  (value) => _availableController.toggleCheckbox(value!, 6),
            ),
            Spacer(),
            CustomButton(
              text: 'Submit',
              onPressed:
                  () => Get.dialog(
                    AlertDialog(
                      backgroundColor: Colors.white,
                      content: CustomDialog(
                        imagePath: AssetPath.successBack,
                        height: Get.width,
                        title: 'Congratulations!',
                        subtitle:
                            'Your account is ready to use. You will be redirected to the home page in a few seconds',
                        titleFontSize: 20.sp,
                        subtitleFontSize: 14.sp,
                        onTap: () {
                          Get.to(SpNavBar());
                        },
                      ),
                    ),
                  ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }

  Widget availableTime({
    required String dayTitle,
    required RxBool isChecked,
    required void Function(bool?)? onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.35,
          child: Row(
            children: [
              Obx(
                () => Checkbox(
                  value: isChecked.value,
                  activeColor: AppColors.primaryThemeColor,
                  onChanged: onChanged,
                ),
              ),
              Expanded(
                child: CustomPoppinsText(
                  text: dayTitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        Gap(20),
        Expanded(
          child: CustomDropdown2(
            selectedValue: '(6 AM - 10 AM)',
            items: _availableController.serviceTypeOptions,
            borderRadius: 10,
            maxLines: 1,
            onChanged: (value) {
              debugPrint(value.toString());
            },
          ),
        ),
      ],
    );
  }
}
