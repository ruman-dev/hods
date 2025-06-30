import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/widgets/filter_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: true,
        titleWidget: CustomAppTitle(title: 'Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    hintText: 'Search',
                    prefixIcon: Icons.search_outlined,
                    suffixWidget: Icon(
                      Icons.close_outlined,
                      size: 22,
                      color: AppColors.lightGrey,
                    ),
                    borderSide: BorderSide(
                      color: AppColors.primaryThemeColor,
                      width: 1.5,
                    ),
                  ),
                ),
                Gap(10),
                GestureDetector(
                  onTap:
                      () => Get.bottomSheet(
                        backgroundColor: Colors.white,
                        enableDrag: true,
                        isScrollControlled: true,
                        FilterWidget(),
                      ),
                  child: SvgPicture.asset(
                    AssetPath.filterIcon,
                    width: 28,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
