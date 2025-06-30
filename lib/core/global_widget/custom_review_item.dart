import 'package:huds/core/exports/exports.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/75683fd57261c2ae940abab762a6e0130b36b3a9',
                  ),
                ),
              ),
            ),
            Gap(10),
            CustomPoppinsText(
              text: 'Ahmad Faisal',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            Icon(Icons.more_horiz_outlined),
          ],
        ),
        Gap(10),
        Row(
          children: [
            RatingBar(
              size: 20,
              filledIcon: Icons.star_rounded,
              emptyIcon: Icons.star_border_rounded,
              onRatingChanged: (value) => debugPrint('$value'),
              initialRating: 4.8,
              maxRating: 5,
            ),
            Gap(8),
            CustomPoppinsText(
              text: '4.8',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
            ),
          ],
        ),
        Gap(10),
        CustomPoppinsText(
          text:
              'Aaron Schmeler of PipeMaster Plumbing for an informative look at plumbing services — what they cover, why they\'re essential',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        Gap(20),
      ],
    );
  }
}
