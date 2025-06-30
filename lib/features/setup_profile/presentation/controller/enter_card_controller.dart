import 'package:huds/core/exports/exports.dart';

class EnterCardController extends GetxController {
  final cardNumber = TextEditingController();
  final cardHolderName = TextEditingController();
  final expiredDate = TextEditingController();
  final cvvCode = TextEditingController();

  @override
  void dispose() {
    cardNumber.dispose();
    cardHolderName.dispose();
    cvvCode.dispose();
    expiredDate.dispose();
    super.dispose();
  }
}
