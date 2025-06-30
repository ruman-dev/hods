import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_add_service_screen.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_history_screen.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_service_details_screen.dart';

class SpHomeScreen extends StatelessWidget {
  const SpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.primaryThemeColor,
      body: SafeArea(
        child: Column(
          children: [
            TopAppBarWidget(),
            Gap(screenSize * 0.03),
            Container(
              width: double.maxFinite,
              height: Get.width * 1.73,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPoppinsText(
                    text: 'My Services',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Gap(screenSize * 0.025),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 25,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(SpServiceDetailsScreen()),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  serviceItemImage(),
                                  ServiceItemWidget(),
                                ],
                              ),
                              ServiceCategory(),
                              ServicePrice(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(screenSize * 0.03),
                  CustomButton(
                    text: 'Provided Service History',
                    onPressed: () => Get.to(SpHistoryScreen()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceItemImage() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/b10b5991b843ec63e1a4d31c30a76120f9e3426b',
          ),
        ),
      ),
    );
  }
}

class ServicePrice extends StatelessWidget {
  const ServicePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Get.width * 0.02,
      top: Get.width * 0.21,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xFFA9A9F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomPoppinsText(
          text: '\$22.50',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          isUppercase: true,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ServiceCategory extends StatelessWidget {
  const ServiceCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Get.width * 0.02,
      top: Get.width * 0.02,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomPoppinsText(
          text: 'Pipe Fitting',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          isUppercase: true,
          color: AppColors.primaryThemeColor,
        ),
      ),
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.width * 0.02),
      decoration: BoxDecoration(
        color: Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Gap(Get.width * 0.03),
          Row(
            children: [
              Icon(Icons.star_rounded, color: Color(0xFFFFBD00)),
              Gap(5),
              CustomPoppinsText(
                text: '4.3',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.lightGrey,
              ),
            ],
          ),
          Gap(Get.width * 0.03),
          CustomPoppinsText(
            text: 'Pipe Master Plumbing',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFEDEEF4),
                ),
                child: CustomPoppinsText(
                  text: 'View Details',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryThemeColor,
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(SpAddServiceScreen(isEditScreen: true)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFF6F7F9),
                    border: Border.all(color: Color(0xFFE3E3E9)),
                  ),
                  child: CustomPoppinsText(
                    text: 'Edit',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F7F8A),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopAppBarWidget extends StatelessWidget {
  const TopAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(16),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/5a1dcd03cc0c246a54cf6363baa7cb5caf474b36',
              ),
            ),
          ),
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPoppinsText(
              text: 'Hi, Wade Warren!',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AssetPath.location_2,
                  width: 12,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                Gap(5),
                CustomPoppinsText(
                  text: 'Golden Avenue, Abuja',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
