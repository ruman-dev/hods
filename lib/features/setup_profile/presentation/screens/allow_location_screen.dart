import 'package:huds/core/exports/exports.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetPath.location, width: 158),
            Gap(Get.width * 0.2),
            CustomPoppinsText(
              text: 'What is your location?',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            Gap(Get.width * 0.05),
            CustomPoppinsText(
              text:
                  'We need to know your location in order to suggest nearby services.',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
              textAlign: TextAlign.center,
            ),
            Gap(Get.width * 0.1),
            CustomButton(
              text: 'Allow Location Access',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: Container(
                        height: Get.width * 0.5,
                        width: double.maxFinite,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPoppinsText(
                              text: 'Confirm Location',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            Gap(20),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 30,
                                  color: AppColors.lightGrey,
                                ),
                                Gap(10),
                                Expanded(
                                  child: CustomPoppinsText(
                                    text:
                                        'Golden Avenue, 0520 Preston Rd. Ingl',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGrey,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Gap(25),
                            CustomButton(
                              text: 'Confirm',
                              onPressed: () => Get.to(EnterCardScreen()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Gap(Get.width * 0.05),
            CustomButton(
              text: 'Enter Location Manually',
              backgroundColor: Color(0xFFF9F9FB),
              textColor: AppColors.darkGrey,
              onPressed: () => Get.toNamed(AppRouteNames().manualLocation),
            ),
          ],
        ),
      ),
    );
  }
}
