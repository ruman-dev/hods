import 'package:fl_chart/fl_chart.dart';
import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/service_provider/earnings/presentation/controller/sp_earnings_controller.dart';
import 'package:huds/features/user_flow/home/presentation/widgets/custom_payment_dialog.dart';

class SpEarningsScreen extends StatelessWidget {
  SpEarningsScreen({super.key});

  final _earningsController = Get.put(SpEarningsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Earnings Overview')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x33718096)),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1, vertical: Get.height * 0.04),
                    child: Column(
                      spacing: 15.h,
                      children: [
                        CustomPoppinsText(text: 'Total Revenue', fontSize: 20, fontWeight: FontWeight.w400),
                        CustomPoppinsText(text: '\$350.00', fontSize: 30, fontWeight: FontWeight.w600),
                        CustomButton(
                          text: 'Withdraw',
                          width: Get.width * 0.35,
                          height: Get.width * 0.03,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (_) {
                                return CustomPaymentDialog(isUser: false);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.width * 0.15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x33718096)),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomPoppinsText(text: 'Overview', fontSize: 22, fontWeight: FontWeight.w600),
                            Obx(
                              () => Container(
                                height: Get.height * 0.04,
                                width: Get.width * 0.28,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(color: Color(0x1A7172CC), borderRadius: BorderRadius.circular(100.r)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _earningsController.earningsSelectedValue.value,
                                    isExpanded: true,
                                    icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryThemeColor),
                                    items:
                                        _earningsController.earningsSelectedItems.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomPoppinsText(
                                                  text: value,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primaryThemeColor,
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                    onChanged: (String? newValue) {
                                      _earningsController.earningsSelectedValue.value = newValue!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: Get.pixelRatio * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18, left: 12, top: 24, bottom: 12),
                              child: LineChart(mainData()),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 34,
                            child: TextButton(
                              onPressed: () {
                                _earningsController.showAvg = !_earningsController.showAvg;
                              },
                              child: Text(
                                'avg',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _earningsController.showAvg ? Colors.white.withValues(alpha: 0.5) : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  List<String> days = ['Sat', 'Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri'];

  Widget text =
      (value.toInt() >= 0 && value.toInt() < days.length)
          ? CustomPoppinsText(text: days[value.toInt()], fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightGrey)
          : CustomPoppinsText(text: days[value.toInt()], fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightGrey);

  return SideTitleWidget(meta: meta, child: text);
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  List<String> numbers = ['400', '600', '800', '1000', '1200'];
  Widget totalNumbers =
      (value.toInt() >= 0 && value.toInt() < numbers.length)
          ? CustomPoppinsText(text: numbers[value.toInt()], fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightGrey)
          : CustomPoppinsText(text: '', fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.lightGrey);

  return SideTitleWidget(meta: meta, child: totalNumbers);
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      // Keep interval at 1 for equal spacing
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return const FlLine(color: Color(0xFFF1F1F5), strokeWidth: 1.5);
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(color: AppColors.primaryThemeColor, strokeWidth: 1);
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: Get.width * 0.07,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, interval: 1, getTitlesWidget: leftTitleWidgets, reservedSize: Get.height * 0.06),
      ),
    ),
    borderData: FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d))),
    minX: 0,
    maxX: 6,
    minY: -1,
    maxY: 5,

    // Increased to 6 to align with 5 labels
    lineBarsData: [
      LineChartBarData(
        spots: const [FlSpot(0, 3), FlSpot(1, 2), FlSpot(2, 5), FlSpot(3, 3.1), FlSpot(4, 4), FlSpot(5, 3), FlSpot(6, 4)],
        isCurved: true,
        color: AppColors.primaryThemeColor,
        barWidth: 3.5,

        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
      ),
    ],
  );
}
