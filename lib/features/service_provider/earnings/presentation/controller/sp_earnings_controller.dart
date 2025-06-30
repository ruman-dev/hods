import 'package:get/get.dart';

class SpEarningsController extends GetxController {
  RxString earningsSelectedValue = 'Weekly'.obs;
  RxList<String> earningsSelectedItems = ['Weekly', 'Monthly', 'Yearly'].obs;
  bool showAvg = false;

  void onChanged(String? newValue) {
    earningsSelectedValue.value = newValue!;
  }
}
