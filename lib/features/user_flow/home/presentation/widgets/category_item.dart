import 'package:huds/core/exports/exports.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryImg,
    required this.title,
  });

  final String categoryImg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFF0F0FA), width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width * 0.3,
              height: Get.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(categoryImg),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: CustomPoppinsText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
