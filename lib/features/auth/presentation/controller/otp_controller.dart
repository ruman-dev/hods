import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }
}
