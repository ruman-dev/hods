import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/service_provider/setup_profile/presentation/screens/sp_setup_profile_screen.dart';
import 'package:huds/features/setup_profile/presentation/controller/manual_location_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManualLocationScreen extends StatelessWidget {
  ManualLocationScreen({super.key});

  final _controller = Get.put(ManualLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: false,
        titleWidget: AppTitle(
          titleEnabled: true,
          titleText: 'Enter Your Location',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                textController: _controller.searchController,
                hintText: 'Search Location',
                prefixIcon: Icons.search,
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetPath.myLocation),
                  Gap(10),
                  GestureDetector(
                    onTap: () {
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
                                    onPressed: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();
                                      if (prefs.getBool('isUser') == true) {
                                        Get.to(EnterCardScreen());
                                      } else {
                                        Get.to(SpSetupProfileScreen());
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: CustomPoppinsText(
                      text: 'Use my current location',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryThemeColor,
                    ),
                  ),
                ],
              ),
              Gap(Get.width * 0.08),
              CustomPoppinsText(
                text: 'Recent Searches',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Divider(),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.lightGrey,
                    ),
                    title: CustomPoppinsText(
                      text: 'Golden Avenue, 0520 Preston Rd. Ingl',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  );
                },
              ),

              CustomPoppinsText(
                text: 'Saved Places',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Divider(),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.lightGrey,
                    ),
                    title: CustomPoppinsText(
                      text: 'Golden Avenue, 0520 Preston Rd. Ingl',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
