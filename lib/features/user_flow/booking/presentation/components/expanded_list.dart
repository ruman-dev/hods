import 'package:huds/core/exports/exports.dart';

class ExpandedList extends StatelessWidget {
  const ExpandedList({
    super.key,
    this.expandedTextTitle,
    required this.widgets,
    required this.index,
    this.title,
  });

  final String? expandedTextTitle;
  final List<Widget> widgets;
  final int index;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final RxList<bool> isExpandedList = List.generate(3, (index) => false).obs;
    return Obx(
      () => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
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
                padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 10),
                child: Text(
                  title ?? '',
                  style: GoogleFonts.poppins(
                    color: AppColors.darkGrey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              initiallyExpanded: isExpandedList[index],
              onExpansionChanged: (bool expanded) {
                isExpandedList[index] = expanded;
              },
              trailing: Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  isExpandedList[index]
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: AppColors.primaryThemeColor,
                ),
              ),
              children: widgets,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
