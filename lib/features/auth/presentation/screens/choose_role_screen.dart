import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/utils/notification_service.dart';

class ChooseRoleScreen extends StatelessWidget {
  ChooseRoleScreen({super.key});

  final _controller = Get.put(ChooseRoleController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SvgPicture.asset(AssetPath.appLogo, width: 105, height: 100),
                Gap(screenWidth * 0.05),
                CustomPoppinsText(
                  text: 'HODS',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey,
                ),
                Gap(screenWidth * 0.05),
                CustomPoppinsText(
                  text: 'Choose Your Role to Begin',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGrey,
                ),
                Gap(screenWidth * 0.2),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      _controller.isUserSelected.value = true;
                      _controller.isDriverSelected.value = false;
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Get.width * 0.025,
                        bottom: Get.width * 0.025,
                        left: Get.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color:
                            _controller.isUserSelected.value
                                ? AppColors.primaryThemeColor
                                : Color(0x337172CC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        leading: Icon(
                          color:
                              _controller.isUserSelected.value
                                  ? Colors.white
                                  : AppColors.darkGrey,
                          Icons.person,
                          size: 35,
                        ),
                        title: CustomPoppinsText(
                          text: 'Sign up as a User',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              _controller.isUserSelected.value
                                  ? Colors.white
                                  : AppColors.darkGrey,
                        ),
                        trailing: Radio(
                          value: _controller.isUserSelected.value,
                          groupValue: true,
                          onChanged: (value) {},
                          activeColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.width * 0.05),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      _controller.isDriverSelected.value = true;
                      _controller.isUserSelected.value = false;
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Get.width * 0.025,
                        bottom: Get.width * 0.025,
                        left: Get.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color:
                            _controller.isDriverSelected.value
                                ? AppColors.primaryThemeColor
                                : Color(0x337172CC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        leading: Icon(
                          color:
                              _controller.isDriverSelected.value
                                  ? Colors.white
                                  : AppColors.darkGrey,
                          Icons.person,
                          size: 35,
                        ),
                        title: CustomPoppinsText(
                          text: 'Sign up as a Service Provider',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              _controller.isDriverSelected.value
                                  ? Colors.white
                                  : AppColors.darkGrey,
                        ),
                        trailing: Radio(
                          value: _controller.isDriverSelected.value,
                          groupValue: true,
                          onChanged: (value) {},
                          activeColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    if (_controller.isUserSelected.value == true ||
                        _controller.isDriverSelected.value == true) {
                      Get.toNamed(AppRouteNames().register);
                    } else {
                      NotificationService.errorMessage('Please select a role');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
