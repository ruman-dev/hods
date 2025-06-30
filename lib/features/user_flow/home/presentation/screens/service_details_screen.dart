import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/service_detail_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/select_worker_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});

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
                    text: 'Plumbing',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                  ),
                  CustomPoppinsText(
                    text: '\$250.00',
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

              ExpansionTitleWidget(
                serviceDetailController: _serviceDetailController,
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPoppinsText(
                    text: 'Location',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomPoppinsText(
                    text: 'Open Map',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryThemeColor,
                  ),
                ],
              ),
              Gap(15),
              Container(
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryThemeColor.withValues(alpha: 0.15),
                ),
                child: Center(
                  child: CustomPoppinsText(
                    text: 'Google Map',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryThemeColor,
                  ),
                ),
              ),
              Gap(20),
              CustomButton(
                text: 'Booking Now',
                onPressed: () => Get.to(SelectWorkerScreen()),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTitleWidget extends StatelessWidget {
  const ExpansionTitleWidget({
    super.key,
    required ServiceDetailController serviceDetailController,
  }) : _serviceDetailController = serviceDetailController;

  final ServiceDetailController _serviceDetailController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionTile(
        backgroundColor: Color(0x1A7172CC),
        collapsedBackgroundColor: Color(0x1A7172CC),
        tilePadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 10),
          child: Text(
            _serviceDetailController.serviceData[0]['title'] ?? '',
            style: GoogleFonts.poppins(
              color: AppColors.darkGrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        initiallyExpanded: _serviceDetailController.isExpanded.value,
        onExpansionChanged: (bool expanded) {
          _serviceDetailController.isExpanded.value = expanded;
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(
            _serviceDetailController.isExpanded.value
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined,
            color: AppColors.darkGrey,
          ),
        ),
        children: [
          Divider(
            indent: 17,
            endIndent: 17,
            thickness: 1.5,
            color: Color(0xFFE3E3E9),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                _serviceDetailController.serviceData[0]['subtitle']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.lightGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
