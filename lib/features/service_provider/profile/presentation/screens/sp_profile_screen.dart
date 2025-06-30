import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_dialog_2.dart';
import 'package:huds/features/user_flow/profile/presentation/controller/profile_controller.dart';

class SpProfileScreen extends StatelessWidget {
  SpProfileScreen({super.key});

  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: false,
        titleWidget: CustomAppTitle(title: 'Profile'),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/5a1dcd03cc0c246a54cf6363baa7cb5caf474b36',
                    ),
                    radius: Get.width * 0.12,
                  ),

                  Positioned(
                    top: Get.width * 0.17,
                    left: Get.width * 0.17,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.primaryThemeColor,
                        child: SvgPicture.asset(
                          AssetPath.editIcon,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          width: 14.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomPoppinsText(
                text: 'Wade Warren',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.darkGrey,
              ),
              CustomPoppinsText(
                text: 'Plumber',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.lightGrey,
              ),
              Divider(color: Color(0xFFF5F5F5)),
              SizedBox(height: 20.w),
              Expanded(
                child: ListView.builder(
                  itemCount: _controller.profileItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.toNamed(AppRouteNames().spEditProfile);
                            break;
                          case 1:
                            Get.toNamed(AppRouteNames().support);
                            break;
                          case 2:
                            Get.toNamed(AppRouteNames().privacyPolicy);
                            break;
                          case 3:
                            showLogoutDialog(context);
                            break;
                        }
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset(
                              _controller.profileItems[index]['imgPath']!,
                              width: 24.w,
                              height: 24.h,
                              colorFilter: ColorFilter.mode(
                                _controller.profileItems[index]['title'] ==
                                        'Logout'
                                    ? AppColors.primaryThemeColor
                                    : AppColors.darkGrey,
                                BlendMode.srcIn,
                              ),
                            ),
                            title: CustomPoppinsText(
                              text: _controller.profileItems[index]['title']!,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  _controller.profileItems[index]['title'] ==
                                          'Logout'
                                      ? AppColors.primaryThemeColor
                                      : AppColors.darkGrey,
                            ),
                          ),
                          Divider(
                            color: Color(0xFFF5F5F5),
                            endIndent: Get.width * 0.05,
                            indent: Get.width * 0.05,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future showLogoutDialog(BuildContext context) {
  return Get.dialog(
    transitionCurve: Curves.easeInQuad,
    transitionDuration: Duration(milliseconds: 200),
    AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(0),
      content: CustomDialog2(
        height: Get.width,
        title: 'Logout',
        subtitle: 'Are you sure you want to log out?',
        onFirstBtnTap: () => Get.offAllNamed(AppRouteNames().login),
        onSecondBtnTap: () => Get.back(),
      ),
    ),
  );
}
