import 'package:dotted_line/dotted_line.dart';
import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/checkout_controller.dart';
import 'package:huds/features/user_flow/home/presentation/widgets/custom_payment_dialog.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final _checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Checkout')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1.5, color: Color(0xFFE3E7EC)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.18,
                      height: Get.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/b10b5991b843ec63e1a4d31c30a76120f9e3426b',
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    TopCheckoutContent(),
                  ],
                ),
              ),
              Gap(20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1.5, color: Color(0xFFE3E7EC)),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomPoppinsText(
                        text: 'Your service',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Gap(15),
                    ConfirmServicesWidget(leadingIcon: Icons.handyman_outlined, title: 'Services', trailing: 'Plumber'),
                    Gap(15),
                    ConfirmServicesWidget(leadingIcon: Icons.person_outline, title: 'Worker', trailing: 'Aaron Schmeler'),
                    Gap(15),
                    ConfirmServicesWidget(leadingIcon: Icons.today_outlined, title: 'Dates', trailing: 'Thu, 2 May 2025'),
                    Gap(20),
                    DottedLine(dashColor: Color(0xFFE3E7EC), dashGapLength: 8),
                    Gap(20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomPoppinsText(
                        text: 'Price Details',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    Gap(15),
                    ConfirmServicesWidget(
                      leadingIcon: Icons.today_outlined,
                      title: 'Dates',
                      trailing: '\$22.00',
                      isIconNeeded: false,
                    ),
                    Gap(15),
                    ConfirmServicesWidget(
                      leadingIcon: Icons.today_outlined,
                      title: 'Apps fee',
                      trailing: '\$2.50',
                      isIconNeeded: false,
                    ),
                    Gap(15),
                    ConfirmServicesWidget(
                      leadingIcon: Icons.today_outlined,
                      title: 'Total price',
                      trailing: '\$24.50',
                      isIconNeeded: false,
                      titleFontSize: 14,
                      titleFontWeight: FontWeight.w700,
                      trailingFontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'Price Details',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightGrey,
                ),
              ),
              Gap(10),
              CustomInputField(
                hintText: 'Selected Promo',
                prefixIcon: Icons.percent_outlined,
                prefixIconColor: AppColors.primaryThemeColor,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Get.width * 0.25,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomPoppinsText(text: 'Total Prize: ', fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.darkBlack),
                  CustomRichtext(
                    primaryText: '\$36',
                    secondaryText: '/hour',
                    primeFontSize: 24,
                    primeFontWeight: FontWeight.w600,
                    primeTextColor: AppColors.primaryThemeColor,
                    secTextColor: AppColors.lightGrey,
                    secFontWeight: FontWeight.w500,
                    secFontSize: 12,
                  ),
                ],
              ),
              Gap(20),
              Expanded(
                child: CustomButton(
                  text: 'Booking Now',
                  onPressed: () {
                    Get.bottomSheet(backgroundColor: Colors.white, CustomPaymentDialog(isUser: true));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmServicesWidget extends StatelessWidget {
  const ConfirmServicesWidget({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailing,
    this.isIconNeeded = true,
    this.titleFontSize,
    this.titleFontWeight,
    this.trailingFontSize,
    this.trailingFontWeight,
  });

  final String title;
  final IconData leadingIcon;
  final String trailing;
  final bool? isIconNeeded;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final double? trailingFontSize;
  final FontWeight? trailingFontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isIconNeeded == true ? Icon(leadingIcon, color: AppColors.darkGrey) : SizedBox.shrink(),
        isIconNeeded == true ? Gap(10) : Gap(0),
        CustomPoppinsText(
          text: title,
          fontSize: titleFontSize ?? 14,
          fontWeight: titleFontWeight ?? FontWeight.w500,
          color: AppColors.darkBlack,
        ),
        const Spacer(),
        CustomPoppinsText(
          text: trailing,
          fontSize: trailingFontSize ?? 14,
          fontWeight: trailingFontWeight ?? FontWeight.w600,
          color: AppColors.darkBlack,
        ),
      ],
    );
  }
}

class TopCheckoutContent extends StatelessWidget {
  const TopCheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPoppinsText(text: 'Plumbing', fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
        Gap(3),
        CustomPoppinsText(text: 'San Diego, California', fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
        Gap(3),
        Row(
          children: [
            Icon(Icons.star_rounded, size: 18, color: Color(0xFFFACC15)),
            CustomPoppinsText(text: '4.4', fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFFACC15)),
            Gap(6),
            CustomPoppinsText(text: '(532)', fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.lightGrey),
          ],
        ),
      ],
    );
  }
}
