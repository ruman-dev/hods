import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_review_item.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_add_service_screen.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_review_details.dart';
import 'package:huds/features/user_flow/home/presentation/controller/service_detail_controller.dart';

class SpServiceDetailsScreen extends StatelessWidget {
  SpServiceDetailsScreen({super.key});

  final _serviceDetailController = Get.put(ServiceDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: true,
        titleWidget: CustomAppTitle(title: 'Service Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: Get.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/9a43a34a2eaeff0c5cb32265cfd50ad98a2a43c9',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.01,
                    top: Get.width * 0.01,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPoppinsText(
                    text: 'Pipe Master Plumbing',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                  ),
                  CustomPoppinsText(
                    text: '\$22.50',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111111),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: CustomPoppinsText(
                      text: '1234 Main St Los Angeles, CA',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  Gap(5),
                  Icon(Icons.star_rounded, color: Color(0xFFFACC15), size: 20),
                  CustomPoppinsText(
                    text: '4.2',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFACC15),
                  ),
                  Gap(5),
                  CustomPoppinsText(
                    text: '(532)',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                  ),
                ],
              ),
              Gap(5),
              Divider(color: Color(0x3D949298), thickness: 1),
              Gap(15),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'About Us',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(5),
              CustomRichtext(
                primaryText:
                    'PipeMaster Plumbing is not just a service. it\'s a commitment to providing reliable and efficient plumbing solutions, ensuring your home or business runs smoothly',
                secondaryText: '..... Read More',
                primeTextColor: AppColors.lightGrey,
                primeFontSize: 14,
                secFontSize: 14,
                maxLines: 10,
              ),
              Gap(15),

              userInfo(),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPoppinsText(
                    text: 'All Reviews',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(SpReviewDetails()),
                    child: CustomPoppinsText(
                      text: 'See All',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryThemeColor,
                    ),
                  ),
                ],
              ),
              Gap(15),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomReviewItem();
                },
              ),

              Gap(20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        height: Get.width * 0.2,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomButton(
                text: 'Add New Service',
                onPressed:
                    () => Get.to(SpAddServiceScreen(isEditScreen: false)),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfo() {
    return Container(
      height: Get.width * 0.4,
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0x1A7172CC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12,
                children: [
                  Container(
                    width: Get.width * 0.12,
                    height: Get.width * 0.12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/fabdb328af3c6b7a42a4d5d9073e19cfcca55f35',
                        ),
                      ),
                    ),
                  ),

                  CustomPoppinsText(
                    text: 'Jonathan John',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                spacing: Get.width * 0.03,
                children: [
                  Icon(
                    Icons.phone,
                    size: 25,
                    color: AppColors.primaryThemeColor,
                  ),
                  Icon(
                    Icons.sms_outlined,
                    size: 25,
                    color: AppColors.primaryThemeColor,
                  ),
                ],
              ),
            ],
          ),
          Gap(20),
          Row(
            spacing: 10,
            children: [
              Icon(Icons.email_outlined, size: 25),
              Expanded(
                child: CustomPoppinsText(
                  text: 'example@gmail.com',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Gap(10),
          Row(
            spacing: 10,
            children: [
              Icon(Icons.pin_drop_outlined, size: 25),
              Expanded(
                child: CustomPoppinsText(
                  text: '1901 Thornridge Cir. Shiloh, Hawaii',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
