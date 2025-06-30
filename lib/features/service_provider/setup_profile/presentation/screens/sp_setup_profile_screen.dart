import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dropdown.dart';
import 'package:huds/features/service_provider/setup_profile/presentation/screens/sp_setup_availibility_screen.dart';
import 'package:huds/features/setup_profile/presentation/controller/setup_profile_controller.dart';

class SpSetupProfileScreen extends StatelessWidget {
  SpSetupProfileScreen({super.key});

  final _controller = Get.put(SetupProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: true,
        titleWidget: CustomAppTitle(title: 'Complete Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFCDCED2),
                  child: Icon(Icons.person, color: Colors.white, size: 50),
                ),
              ),
              Gap(10),
              Align(
                alignment: Alignment.center,
                child: CustomPoppinsText(
                  text: 'Upload Profile Picture',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrey,
                ),
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'About Us',
                hintText: 'Tell me about yourself',
                maxLines: 8,
                borderRadius: 20,
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Service Area',
                hintText: 'Location',
              ),
              Gap(20),
              Obx(
                () => CustomInputField(
                  headerTitle: 'Date of Birth',
                  hintText:
                      _controller.selectedDate.value == null
                          ? 'DD/MM/YY'
                          : _controller.formattedDate,
                  keyboardType: TextInputType.streetAddress,
                  suffixWidget: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  isReadOnly: true,
                  onTextFieldPressed: () => _controller.selectDate(context),
                ),
              ),
              Gap(20),
              CustomPoppinsText(
                text: 'Gender',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              Gap(10),
              CustomDropdown(
                selectedValue: _controller.selectedGender.value,
                items: _controller.genderItems,
                onChanged: (value) {
                  debugPrint(value);
                },
              ),
              Gap(30),
              CustomButton(
                text: 'Next',
                onPressed: () => Get.to(SpSetupAvailibilityScreen()),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
