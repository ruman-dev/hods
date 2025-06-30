import 'package:huds/core/exports/exports.dart';

class SpSetupAvailibilityController extends GetxController {
  final serviceTypeOptions = [
    '(6 AM - 10 AM)',
    '(10 AM - 02 PM)',
    '(02 PM - 06 PM)',
    '(06 PM - 10 PM)',
  ];

  final dayTitle1 = true.obs;
  final dayTitle2 = true.obs;
  final dayTitle3 = true.obs;
  final dayTitle4 = true.obs;
  final dayTitle5 = true.obs;
  final dayTitle6 = true.obs;
  final dayTitle7 = true.obs;

  void toggleCheckbox(bool value, int index) {
    switch (index) {
      case 0:
        dayTitle1.value = value;
        break;
      case 1:
        dayTitle2.value = value;
        break;
      case 2:
        dayTitle3.value = value;
        break;
      case 3:
        dayTitle4.value = value;
        break;
      case 4:
        dayTitle5.value = value;
        break;
      case 5:
        dayTitle6.value = value;
        break;
      case 6:
        dayTitle7.value = value;
        break;
    }
  }
}
