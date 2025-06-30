import 'package:huds/core/exports/exports.dart';

class BookingDateController extends GetxController {
  var selectedTimeSlotIndex = (-1).obs;
  var selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  var bookingDates = ['07:00', '08:00', '09:00', '10:00', '11:00'];
}
