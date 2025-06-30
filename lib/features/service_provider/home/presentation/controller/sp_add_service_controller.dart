import 'package:huds/core/exports/exports.dart';
import 'package:intl/intl.dart';

class SpAddServiceController extends GetxController {
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final selectedTime = 'Select Time'.obs;

  String get formattedDate {
    if (selectedDate.value == null) return '';
    return DateFormat('dd-MM-yyyy').format(selectedDate.value!);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return child!;
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      update();
    }
  }

  Future<void> showTimePickerDialog(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

      initialEntryMode: TimePickerEntryMode.dial,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (time != null) {
      final localizations = MaterialLocalizations.of(context);
      final formattedTime = localizations.formatTimeOfDay(
        time,
        alwaysUse24HourFormat: false,
      );
      selectedTime.value = formattedTime;
    }
  }
}
