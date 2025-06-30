import 'package:flutter/gestures.dart';
import 'package:huds/core/exports/exports.dart';

class CustomRichtext extends StatelessWidget {
  const CustomRichtext({
    super.key,
    required this.primaryText,
    this.secondaryText,
    this.primeTextColor,
    this.secTextColor,
    this.primeFontWeight,
    this.secFontWeight,
    this.primeFontSize,
    this.secFontSize,
    this.onPrimePressed,
    this.onSecPressed,
    this.textDecoration,
    this.textAlign,
    this.maxLines,
  });

  final String primaryText;
  final String? secondaryText;
  final Color? primeTextColor;
  final Color? secTextColor;
  final FontWeight? primeFontWeight;
  final FontWeight? secFontWeight;
  final double? primeFontSize;
  final double? secFontSize;
  final void Function()? onPrimePressed;
  final void Function()? onSecPressed;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 2,
      text: TextSpan(
        children: [
          TextSpan(
            text: primaryText,
            style: GoogleFonts.poppins(
              color: primeTextColor ?? const Color(0xFF1A202C),
              fontWeight: primeFontWeight ?? FontWeight.w400,
              fontSize: primeFontSize?.sp ?? 14.sp,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSecPressed, // Click event for primary text
          ),
          TextSpan(
            text: secondaryText,
            style: GoogleFonts.poppins(
              fontWeight: secFontWeight ?? FontWeight.w600,
              fontSize: secFontSize?.sp ?? 14.sp,
              color: secTextColor ?? AppColors.primaryThemeColor,
              decoration: textDecoration ?? TextDecoration.none,
            ),
            recognizer: TapGestureRecognizer()..onTap = onSecPressed, // Click event for secondary text
          ),
        ],
      ),
    );
  }
}
