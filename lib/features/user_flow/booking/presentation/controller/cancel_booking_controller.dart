import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelBookingController extends GetxController {
  var selectedIndex = (-1).obs;
  var isLoading = false.obs;
  final bookingId = Get.parameters['bookingId'];
  final isPaid = Get.parameters['isPaid'];
  final reasonController = TextEditingController();
  List<String> reasons = [
    'Waiting for long time',
    'Unable to contact driver',
    'Driver denied to go to destination',
    'Driver denied to come to pickup',
    'Wrong address shown',
    'The price is not reasonable',
    'Others',
  ];
}
