import 'package:huds/core/exports/exports.dart';

class BookingController extends GetxController {
  // RxList<Booking> activeBookings = <Booking>[].obs;
  // RxList<Booking> completedBookings = <Booking>[].obs;
  // RxList<Booking> cancelledBookings = <Booking>[].obs;

  var isLoading = false.obs;

  var activeBookings = [];
  var completedBookings = [];
  var cancelledBookings = [];
}
