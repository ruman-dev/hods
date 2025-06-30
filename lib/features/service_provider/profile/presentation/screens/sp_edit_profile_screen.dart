import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dropdown.dart';
import 'package:huds/features/user_flow/profile/presentation/controller/edit_profile_controller.dart';

class SpEditProfileScreen extends StatelessWidget {
  SpEditProfileScreen({super.key});

  final EditProfileController _controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRichtext(
              primaryText: 'Full Name',
              secondaryText: '*',
              primeFontSize: 14,
              primeFontWeight: FontWeight.w400,
              primeTextColor: AppColors.darkGrey,
              secTextColor: Colors.red,
            ),
            SizedBox(height: Get.width * 0.03),
            CustomInputField(hintText: 'Your name'),
            SizedBox(height: Get.width * 0.05),
            CustomPoppinsText(
              text: 'Edit Address',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: Get.width * 0.03),
            CustomInputField(hintText: 'Your address'),
            SizedBox(height: Get.width * 0.05),
            CustomPoppinsText(
              text: 'Email',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: Get.width * 0.03),
            CustomInputField(hintText: 'name@example.com', isReadOnly: true),
            SizedBox(height: Get.width * 0.05),
            CustomRichtext(
              primaryText: 'Gender',
              secondaryText: '*',
              primeFontSize: 14,
              primeFontWeight: FontWeight.w400,
              primeTextColor: AppColors.darkGrey,
              secTextColor: Colors.red,
            ),
            SizedBox(height: Get.width * 0.03),

            Obx(
              () => CustomDropdown(
                selectedValue: _controller.selectedGender.value,
                items: _controller.genderList,
                onChanged: _controller.onGenderChanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _controller.genderFlag.value = false;
                  } else {
                    _controller.genderFlag.value = true;
                  }
                  return null;
                },
              ),
            ),
            Spacer(),
            CustomButton(
              text: 'Update',
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: Get.width * 0.05),
          ],
        ),
      ),
    );
  }
}
