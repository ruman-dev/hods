import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPassController extends GetxController {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
