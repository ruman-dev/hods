import 'package:huds/core/exports/exports.dart';

class SpReviewDetails extends StatelessWidget {
  const SpReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Review on Services'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPoppinsText(
                text: 'Customer Review By Service Name',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Gap(20),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width * 0.1,
                              height: Get.width * 0.1,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/7880b06333758dca6cd0ba8e5f8b9f34cf0d20d6',
                                  ),
                                ),
                              ),
                            ),
                            Gap(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomPoppinsText(
                                  text: 'Donna Bins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomPoppinsText(
                                  text: '@DONNABINS',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(20),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomPoppinsText(
                                  text: 'Service Name : Painting',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Gap(5),
                              Divider(color: Color(0xFFE3E3E9)),
                              Gap(5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFFFFBD00),
                                      ),
                                      Gap(5),
                                      CustomPoppinsText(
                                        text: '4.5',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGrey,
                                      ),
                                    ],
                                  ),
                                  CustomPoppinsText(
                                    text: '25 Jan',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                              Gap(10),
                              CustomPoppinsText(
                                text:
                                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet. ',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
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
