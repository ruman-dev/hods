import 'package:huds/core/exports/exports.dart';

class RegisterController extends GetxController {
  var isPassVisible = false.obs;
  var isChecked = true.obs;

  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passController.dispose();
  }
}
