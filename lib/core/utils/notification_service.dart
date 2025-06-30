import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huds/core/app_colors/app_colors.dart';

class NotificationService {
  static void successMessage(String subtitle) {
    Get.snackbar(
      'Success',
      subtitle,
      colorText: Colors.white,
      backgroundColor: AppColors.primaryThemeColor,
    );
  }

  static void errorMessage(String subtitle) {
    Get.snackbar(
      'Error',
      subtitle,
      colorText: Colors.white,
      backgroundColor: AppColors.redColor,
    );
  }
}
