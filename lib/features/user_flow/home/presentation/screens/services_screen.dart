import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/screens/question_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: CustomPoppinsText(
            text: 'Services',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.primaryThemeColor,
            labelColor: AppColors.primaryThemeColor,
            labelStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            isScrollable: true,
            tabs: [
              Tab(text: 'Handyman'),
              Tab(text: 'Spa & wellness'),
              Tab(text: 'Mobile Health'),
              Tab(text: 'Hair & beauty'),
              Tab(text: 'Home repairs'),
              Tab(text: 'Home cleaning'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ServiceType(),
            ServiceType(),
            ServiceType(),
            ServiceType(),
            ServiceType(),
            ServiceType(),
          ],
        ),
      ),
    );
  }
}

class ServiceType extends StatelessWidget {
  const ServiceType({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(QuestionScreen(serviceTitle: 'Plumbing')),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPoppinsText(
                        text: 'Plumbing',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFACC15),
                            size: 20,
                          ),
                          Gap(5),
                          CustomPoppinsText(
                            text: '4.4',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: CustomPoppinsText(
                    text: 'Mirror on the wall (and shelves & pictures too).',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF78828A),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Container(
                    width: Get.width * 0.14,

                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/80b14f08a000676618d6fb22d17f31157d326ead',
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(color: Color(0xFFE3E3E9)),
              ],
            ),
          );
        },
      ),
    );
  }
}
