import 'package:huds/core/exports/exports.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;
  ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void updatePageIndex(int index) {
    currentIndex.value = index;
    valueNotifier = ValueNotifier(index.toDouble());
  }
}
