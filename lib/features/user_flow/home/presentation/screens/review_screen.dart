import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:huds/core/exports/exports.dart';
import 'package:huds/core/global_widget/custom_review_item.dart';
import 'package:huds/features/user_flow/home/presentation/screens/booking_date_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Review on Services'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPoppinsText(
                  text: '4.8',
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
                RatingBar(
                  filledIcon: Icons.star_rounded,
                  emptyIcon: Icons.star_border_rounded,
                  onRatingChanged: (value) => debugPrint('$value'),
                  initialRating: 4.8,
                  maxRating: 5,
                ),
                Gap(10),
                CustomPoppinsText(
                  text: '4.8 | 120 reviews',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                Gap(20),
                RatingbarWidget(
                  title: 'Excellent',
                  value: 1,
                  bgColor: AppColors.primaryThemeColor,
                ),
                Gap(20),
                RatingbarWidget(
                  title: 'Nice',
                  value: 0.6,
                  bgColor: AppColors.primaryThemeColor.withValues(alpha: 0.6),
                ),
                Gap(20),
                RatingbarWidget(
                  title: 'Good',
                  value: 0.4,
                  bgColor: AppColors.primaryThemeColor.withValues(alpha: 0.4),
                ),
                Gap(20),
                RatingbarWidget(
                  title: 'Average',
                  value: 0.2,
                  bgColor: AppColors.primaryThemeColor.withValues(alpha: 0.2),
                ),
                Gap(20),
                RatingbarWidget(
                  title: 'Poor',
                  value: 0.1,
                  bgColor: AppColors.primaryThemeColor.withValues(alpha: 0.1),
                ),
                Gap(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomPoppinsText(
                    text: 'All Reviews',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(20),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CustomReviewItem();
                  },
                ),
                CustomButton(
                  text: 'Continue',
                  onPressed: () => Get.to(BookingDateScreen()),
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingbarWidget extends StatelessWidget {
  const RatingbarWidget({
    super.key,
    required this.title,
    required this.value,
    this.bgColor,
  });

  final String title;
  final double value;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomPoppinsText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ),
        Gap(10),
        Expanded(
          flex: 3,
          child: LinearProgressIndicator(
            value: value,
            borderRadius: BorderRadius.circular(12),
            minHeight: 7,
            backgroundColor: Color(0xFFF6F8FE),
            color: bgColor ?? AppColors.primaryThemeColor,
          ),
        ),
      ],
    );
  }
}
