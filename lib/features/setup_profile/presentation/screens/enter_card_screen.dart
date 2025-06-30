import 'package:flutter/services.dart';
import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/setup_profile/presentation/controller/enter_card_controller.dart';
import 'package:huds/features/setup_profile/presentation/screens/setup_profile_screen.dart';

class EnterCardScreen extends StatelessWidget {
  EnterCardScreen({super.key});

  final _controller = Get.put(EnterCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleWidget: CustomAppTitle(title: 'Enter Credit Card'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                headerTitle: 'Card Number',
                textController: _controller.cardNumber,
                hintText: 'Enter Card Number',
                keyboardType: TextInputType.number,
              ),
              Gap(20),
              CustomInputField(
                headerTitle: 'Card Holder Name',
                textController: _controller.cardHolderName,
                hintText: 'Enter Holder Name',
                keyboardType: TextInputType.name,
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputField(
                          headerTitle: 'Expired',
                          textController: _controller.expiredDate,
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            CardExpirationFormatter(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputField(
                          headerTitle: 'CVV Code',
                          textController: _controller.cvvCode,
                          hintText: 'CVV',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.width),
              CustomButton(
                text: 'Next',
                onPressed: () => Get.to(SetupProfileScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
