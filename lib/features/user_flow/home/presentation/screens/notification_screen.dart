import 'package:huds/core/exports/exports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: true,
        titleWidget: CustomAppTitle(title: 'Notifications'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0x1A7172CC),
                    child: SvgPicture.asset(AssetPath.notificationIcon),
                  ),
                  title: CustomPoppinsText(
                    text: 'Order Received',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: CustomPoppinsText(
                    text: 'Pipe Fitting Service order has been received.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    color: AppColors.lightGrey,
                  ),
                  trailing: CustomPoppinsText(
                    text: '14h',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGrey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
