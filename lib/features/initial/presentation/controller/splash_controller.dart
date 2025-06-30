import 'package:huds/core/exports/exports.dart';

class SplashController extends GetxController {
  void _moveToNext() async {
    await Future.delayed(Duration(seconds: 3), () {
      //   String? accessToken = StorageService().getData(
      //     AuthConstants.instance.accessToken,
      //   );
      // if (accessToken != null) {
      Get.offAllNamed(AppRouteNames().onboarding);
      // } else {
      // Get.offAllNamed(AppRouteNames().healthBoxScreen);
      // }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _moveToNext();
  }
}
