import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/booking_date_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/checkout_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDateScreen extends StatelessWidget {
  BookingDateScreen({super.key});

  final _bookingDateController = Get.put(BookingDateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Date Booking')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _bookingDateController.selectedDate.value,
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: GoogleFonts.poppins(
                      color: AppColors.primaryThemeColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    weekendStyle: GoogleFonts.poppins(
                      color: AppColors.primaryThemeColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    selectedDecoration: BoxDecoration(
                      color: AppColors.primaryThemeColor,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(
                      day,
                      _bookingDateController.selectedDate.value,
                    );
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    _bookingDateController.updateSelectedDate(selectedDay);
                    debugPrint(_bookingDateController.selectedDate.toString());
                  },
                ),
              ),
              Gap(20),
              CustomPoppinsText(
                text: 'Time',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Gap(10),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: _bookingDateController.bookingDates.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Get.width * 0.007,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Obx(
                    () => GestureDetector(
                      onTap:
                          () =>
                              _bookingDateController
                                  .selectedTimeSlotIndex
                                  .value = index,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                _bookingDateController
                                            .selectedTimeSlotIndex
                                            .value ==
                                        index
                                    ? AppColors.primaryThemeColor
                                    : Color(0xFFE3E7EC),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color:
                              _bookingDateController
                                          .selectedTimeSlotIndex
                                          .value ==
                                      index
                                  ? AppColors.primaryThemeColor
                                  : Colors.white,
                        ),
                        child: Center(
                          child: CustomPoppinsText(
                            text: _bookingDateController.bookingDates[index],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                            color:
                                _bookingDateController
                                            .selectedTimeSlotIndex
                                            .value ==
                                        index
                                    ? Colors.white
                                    : AppColors.darkGrey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Get.width * 0.42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.5, color: Color(0xFFE3E7EC)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  dateWidget(),
                  const Spacer(),
                  SizedBox(
                    height: Get.width * 0.1,
                    child: VerticalDivider(
                      color: Color(0xFFE3E7EC),
                      width: 1.5,
                      thickness: 1.5,
                    ),
                  ),
                  const Spacer(),
                  timeWidget(),
                  const Spacer(),
                ],
              ),
            ),
            Gap(Get.width * 0.05),
            CustomButton(
              text: 'Continue',
              onPressed: () => Get.to(CheckoutScreen()),
            ),
            Gap(Get.width * 0.05),
          ],
        ),
      ),
    );
  }

  Widget dateWidget() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: 20,
              color: AppColors.lightGrey,
            ),
            Gap(6),
            CustomPoppinsText(
              text: 'Date',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        Gap(3),
        CustomPoppinsText(
          text: 'May 20',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }

  Widget timeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 20,
              color: AppColors.lightGrey,
            ),
            Gap(6),
            CustomPoppinsText(
              text: 'Time',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
        Gap(3),
        CustomPoppinsText(
          text: '09:00 AM',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }
}
