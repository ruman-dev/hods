import '../exports/exports.dart';

class CustomAppTitle extends StatelessWidget {
  const CustomAppTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomPoppinsText(
      text: title,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }
}
