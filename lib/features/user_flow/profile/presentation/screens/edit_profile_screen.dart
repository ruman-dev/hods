import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dropdown.dart';
import 'package:huds/features/user_flow/profile/presentation/controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController _controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
              CustomInputField(hintText: 'Your name', keyboardType: TextInputType.name),
              SizedBox(height: Get.width * 0.05),
              CustomInputField(
                headerTitle: 'Edit Address',
                headerFontWeight: FontWeight.w400,
                hintText: 'Your address',
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(height: Get.width * 0.05),
              CustomInputField(
                headerTitle: 'Email',
                headerFontWeight: FontWeight.w400,
                hintText: 'name@example.com',
                isReadOnly: true,
              ),
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
              SizedBox(height: Get.width * 0.7),
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
      ),
    );
  }
}
