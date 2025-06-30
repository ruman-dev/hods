import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huds/core/app_colors/app_colors.dart';

class CustomTextbox extends StatelessWidget {
  const CustomTextbox({
    super.key,
    required this.hint,
    this.controller,
    this.isOptional = true,
    this.isEnableField = true,
    this.fillColor = Colors.white,
    this.borderSide,
    this.fontSize,
    this.fontWeight,
  });

  final String hint;
  final TextEditingController? controller;
  final bool? isOptional;
  final bool? isEnableField;
  final Color? fillColor;
  final BorderSide? borderSide;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          enabled: isEnableField,
          textAlignVertical: TextAlignVertical.top,
          maxLines: null,
          cursorColor: AppColors.primaryThemeColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 50,
              left: 10.w,
              top: 10.h,
              right: 10.w,
            ),

            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: (fontSize ?? 18).sp,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: Colors.grey.shade600,
            ),
            filled: true,
            fillColor: fillColor,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  borderSide ??
                  BorderSide(color: AppColors.primaryThemeColor, width: 1.2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  borderSide ??
                  BorderSide(color: AppColors.primaryThemeColor, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  borderSide ??
                  BorderSide(color: AppColors.primaryThemeColor, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}
