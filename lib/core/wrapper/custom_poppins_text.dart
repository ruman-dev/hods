import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huds/core/app_colors/app_colors.dart';

class CustomPoppinsText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? height;
  final bool? isUppercase;

  const CustomPoppinsText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.height,
    this.isUppercase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isUppercase! ? text.toUpperCase() : text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        fontSize: fontSize?.sp,
        fontWeight: fontWeight,
        color: color ?? AppColors.darkGrey,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}
