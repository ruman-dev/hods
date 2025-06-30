import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/user_home_controller.dart';
import 'package:huds/features/user_flow/home/presentation/widgets/category_full_item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final _homeController = Get.put(UserHomeController());
  // final _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: CommonAppbar(
        leading: true,
        centerTitle: true,
        titleWidget: CustomAppTitle(title: 'Category'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _homeController.categoryImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) {
            return CategoryFullItem(
              categoryImg: _homeController.categoryImages[index]['image']!,
              title: _homeController.categoryImages[index]['title']!,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
