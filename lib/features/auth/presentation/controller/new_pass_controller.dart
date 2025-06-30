import 'package:huds/core/exports/exports.dart';

class NewPassController extends GetxController {
  var isShowNewPass = false.obs;
  var isShowConfirmPass = false.obs;

  void toggleNewPass() {
    isShowNewPass.value = !isShowNewPass.value;
  }

  void toggleConfirmPass() {
    isShowConfirmPass.value = !isShowConfirmPass.value;
  }

  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
}
