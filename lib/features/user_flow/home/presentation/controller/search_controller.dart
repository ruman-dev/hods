import 'package:huds/core/exports/exports.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchViewController extends GetxController {
  final Rx<SfRangeValues> values = Rx<SfRangeValues>(SfRangeValues(100, 500));
  final ratingText = ['5', '4', '3', '2', '1'];
  final selectedIndex = (-1).obs;
  final serviceTypeOptions = [
    'Handyman',
    'Spa & wellness',
    'Mobile Health',
    'Hair & beauty',
    'Home repairs',
    'Home cleaning',
  ];

  final serviceType1 = true.obs;
  final serviceType2 = true.obs;
  final serviceType3 = true.obs;
  final serviceType4 = true.obs;
  final serviceType5 = true.obs;
  final serviceType6 = true.obs;

  void toggleCheckbox(bool value, int index) {
    switch (index) {
      case 0:
        serviceType1.value = value;
        break;
      case 1:
        serviceType2.value = value;
        break;
      case 2:
        serviceType3.value = value;
        break;
      case 3:
        serviceType4.value = value;
        break;
      case 4:
        serviceType5.value = value;
        break;
      case 5:
        serviceType6.value = value;
        break;
    }
  }
}
