import 'package:huds/core/exports/exports.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Message')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInputField(hintText: 'Search', prefixIcon: Icons.search),
            SizedBox(height: Get.width * 0.05),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/5a1dcd03cc0c246a54cf6363baa7cb5caf474b36',
                          ),
                        ),
                        title: CustomPoppinsText(
                          text: 'Wade Warren',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: CustomPoppinsText(
                          text: 'It is a long established fact that is been',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomPoppinsText(
                              text: '04:30 PM',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightGrey,
                            ),
                            Gap(10),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppColors.primaryThemeColor,
                              child: CustomPoppinsText(
                                text: '3',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Color(0xFFEBEBEB), thickness: 1),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
