import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dropdown.dart';
import 'package:huds/features/service_provider/home/presentation/controller/sp_add_service_controller.dart';
import 'package:huds/features/service_provider/nav_bar/sp_nav_bar.dart';

class SpAddServiceScreen extends StatelessWidget {
  SpAddServiceScreen({super.key, required this.isEditScreen});

  final _addServiceController = Get.put(SpAddServiceController());
  final bool isEditScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(
          title: isEditScreen ? 'Edit Services' : 'Add New Services',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Get.width * 0.1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Color(0xFFE3E3E9)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(AssetPath.upload, width: 44),
                    Gap(10),
                    CustomPoppinsText(
                      text: 'Upload photo',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(10),
                    CustomPoppinsText(
                      text:
                          'Upload the front side of your document Supports: JPG, PNG, PDF',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                      textAlign: TextAlign.center,
                    ),
                    Gap(10),
                    CustomButton(
                      text: 'Choose a file',
                      height: Get.width * 0.02,
                      textColor: AppColors.darkGrey,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.white,
                      borderSide: BorderSide(
                        color: AppColors.darkGrey,
                        width: 1.5,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Service Name',
                hintText: 'Plumbing',
                headerFontWeight: FontWeight.w600,
              ),
              Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'Select Category',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(8),
              CustomDropdown(
                selectedValue: 'Plumbing',
                items: ['Plumbing', 'Painting', 'Washing'],
                onChanged: (value) {},
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Service Description',
                hintText: 'Tell me about your service...',
                maxLines: 8,
                borderRadius: 12,
                headerFontWeight: FontWeight.w600,
              ),
              Gap(20),
              Obx(
                () => CustomInputField(
                  headerTitle: 'Time',
                  fontWeight: FontWeight.w600,
                  isReadOnly: true,
                  hintText: _addServiceController.selectedTime.value,
                  onTextFieldPressed:
                      () => _addServiceController.showTimePickerDialog(context),
                ),
              ),
              Gap(20),
              Obx(
                () => CustomInputField(
                  headerTitle: 'Date',
                  headerFontWeight: FontWeight.w600,
                  hintText:
                      _addServiceController.selectedDate.value == null
                          ? 'DD/MM/YY'
                          : _addServiceController.formattedDate,
                  keyboardType: TextInputType.streetAddress,
                  suffixWidget: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  isReadOnly: true,
                  onTextFieldPressed:
                      () => _addServiceController.selectDate(context),
                ),
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Quesion',
                headerFontWeight: FontWeight.w600,
                hintText: 'Your question',
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Address',
                headerFontWeight: FontWeight.w600,
                hintText: 'Enter address',
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Service Price',
                headerFontWeight: FontWeight.w600,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                hintText: '\$20.00',
              ),
              Gap(20),
              CustomButton(
                text: isEditScreen ? 'Update' : 'Create Service',
                onPressed: () => Get.offAll(SpNavBar()),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
