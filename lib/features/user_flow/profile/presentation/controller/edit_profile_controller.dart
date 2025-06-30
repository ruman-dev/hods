import 'package:huds/core/exports/exports.dart';

class EditProfileController extends GetxController {
  var selectedGender = ''.obs;
  var genderFlag = false.obs;
  var genderList = ['Male', 'Female', 'Others'];

  void onGenderChanged(String? newValue) {
    selectedGender.value = newValue!;
    debugPrint(selectedGender.toString());
  }
}
