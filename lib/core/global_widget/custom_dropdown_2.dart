import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huds/core/app_colors/app_colors.dart';

class CustomDropdown2 extends StatelessWidget {
  final double? width;
  final Widget? prefixIcon;
  final String? hintText;
  final String selectedValue;
  final List<String> items;
  final Function(String?) onChanged;
  final TextStyle? textStyle;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final Color? iconColor;
  final int? maxLines;

  const CustomDropdown2({
    super.key,
    this.hintText,
    required this.selectedValue,
    this.textStyle,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.width,
    this.borderWidth,
    this.backgroundColor,
    this.borderRadius,
    this.validator,
    this.iconColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE3E3E9),
          width: borderWidth ?? 1.w,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
        color: backgroundColor ?? Color(0xFFF9F9FB),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        child: Row(
          children: [
            if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 15.w)],
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                ),

                dropdownColor: Colors.white,
                value: selectedValue.isNotEmpty ? selectedValue : null,
                validator: validator,
                hint: Text(
                  hintText ?? 'Select an option',
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines ?? 1,
                  style:
                      textStyle ??
                      GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightGrey,
                      ),
                ),
                items:
                    items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          maxLines: maxLines ?? 1,
                          style:
                              textStyle ??
                              GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGrey,
                              ),
                        ),
                      );
                    }).toList(),
                onChanged: onChanged,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: iconColor ?? Color(0xFF718096),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
