import 'package:flutter/services.dart';
import 'package:huds/core/exports/exports.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  var isPassVisible = false.obs;
  var isChecked = true.obs;
  final LocalAuthentication auth = LocalAuthentication();
  bool? canCheckBiometrics;
  List<BiometricType>? availableBiometrics;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  void togglePasswordVisibility() {
    isPassVisible.value = !isPassVisible.value;
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  Future<void> checkBiometrics() async {
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      debugPrint(e.toString());
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      debugPrint(e.toString());
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      update();

      authenticated = await auth.authenticate(
        localizedReason: 'Scan your face to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      authorized = 'Error - ${e.message}';
      update();
      return false;
    } finally {
      isAuthenticating = false;
      update();
    }

    authorized = authenticated ? 'Authorized' : 'Not Authorized';
    update();
    return authenticated;
  }

  // Future<bool> isBiometricAvailable() async {
  //   return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  // }

  // Future<void> checkBiometrics() async {
  //   late bool canCheckBiometrics;
  //   try {
  //     canCheckBiometrics = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     canCheckBiometrics = false;
  //     print(e);
  //   }
  //   if (!Get.isRegistered<LoginController>()) {
  //     return;
  //   }

  //   canCheckBiometrics = canCheckBiometrics;
  // }

  // Future<void> getAvailableBiometrics() async {
  //   late List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     print(e);
  //   }
  //   if (!Get.isRegistered<LoginController>()) {
  //     return;
  //   }

  //   availableBiometrics = availableBiometrics;
  // }

  // Future<void> authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     isAuthenticating = true;
  //     authorized = 'Authenticating';

  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(stickyAuth: true),
  //     );

  //     isAuthenticating = false;
  //   } on PlatformException catch (e) {
  //     print(e);

  //     isAuthenticating = false;
  //     authorized = 'Error - ${e.message}';

  //     return;
  //   }
  //   if (!Get.isRegistered<LoginController>()) {
  //     return;
  //   }

  //   authorized = authenticated ? 'Authorized' : 'Not Authorized';
  // }

  // Future<void> authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     isAuthenticating = true;
  //     authorized = 'Authenticating';

  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );

  //     isAuthenticating = false;
  //     authorized = 'Authenticating';
  //   } on PlatformException catch (e) {
  //     print(e);

  //     isAuthenticating = false;
  //     authorized = 'Error - ${e.message}';

  //     return;
  //   }
  //   if (!Get.isRegistered<LoginController>()) {
  //     return;
  //   }

  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';

  //   authorized = message;
  // }

  // Future<void> cancelAuthentication() async {
  //   await auth.stopAuthentication();
  //   isAuthenticating = false;
  // }
}
