import 'package:huds/core/exports/exports.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  final List<Map<String, String>> faqData = [
    {
      "title": "How To use booking syestem",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
    },
    {
      "title": "You want to take service into your home?",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
    },
    {
      "title": "You want to take service into your home?",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
    },
  ];
  final RxList<bool> _isExpandedList = List.generate(9, (index) => false).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Support')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomPoppinsText(
                text: 'FAQs',
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Get.width * 0.08),
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Color(0xFFF9F9FB),
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none,
                            ),
                            title: Padding(
                              padding: EdgeInsets.all(18.r),
                              child: Text(
                                faqData[index]['title']!,
                                style: GoogleFonts.poppins(
                                  color: AppColors.darkGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            initiallyExpanded: _isExpandedList[index],
                            onExpansionChanged: (bool expanded) {
                              _isExpandedList[index] = expanded;
                            },
                            trailing: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2.w,
                                    color: AppColors.primaryThemeColor,
                                  ),
                                ),
                                child: Icon(
                                  _isExpandedList[index]
                                      ? Icons.remove
                                      : Icons.add,
                                  color: AppColors.primaryThemeColor,
                                ),
                              ),
                            ),
                            children: [
                              Divider(
                                indent: 17,
                                thickness: 1.5,
                                color: Color(0xFFEDEEF4),
                              ),
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    faqData[index]['subtitle']!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: AppColors.lightGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
