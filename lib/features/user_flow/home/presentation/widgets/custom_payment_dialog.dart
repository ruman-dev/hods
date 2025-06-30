import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/checkout_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/pay_success_screen.dart';

class CustomPaymentDialog extends StatelessWidget {
  CustomPaymentDialog({super.key, required this.isUser});

  final _paymentController = Get.put(CheckoutController());
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Get.width * 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            Divider(color: Color(0xFFDFE2EB), indent: Get.width * 0.43, endIndent: Get.width * 0.43, thickness: 5),
            Gap(Get.width * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPoppinsText(text: 'Payment Method', fontSize: 20, fontWeight: FontWeight.w600),
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close_outlined)),
              ],
            ),
            Gap(15),
            paymentService(imagePath: AssetPath.stripe, value: 0, selectedValue: _paymentController.selectedValue.value),
            Gap(20),
            paymentService(imagePath: AssetPath.afterpay, value: 1, selectedValue: _paymentController.selectedValue.value),
            Spacer(),
            CustomButton(
              text: 'Confirm and Pay',
              onPressed: () {
                Get.to(PaySuccessScreen(isUser: isUser));
                _paymentController.selectedValue.value = (-1);
              },
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }

  Widget paymentService({required String imagePath, required int selectedValue, required int value}) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _paymentController.selectedValue.value = value;
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12, offset: Offset(0, 4))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Image.asset(imagePath, width: 118, height: 72),
              ),
              Radio<int>(
                activeColor: AppColors.primaryThemeColor,
                value: value,
                groupValue: _paymentController.selectedValue.value,
                onChanged: (int? value) {
                  _paymentController.selectedValue.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
