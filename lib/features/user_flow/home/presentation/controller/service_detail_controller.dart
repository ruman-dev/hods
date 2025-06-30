import 'package:huds/core/exports/exports.dart';

class ServiceDetailController extends GetxController {
  var isExpanded = false.obs;

  final List<Map<String, String>> serviceData = [
    {
      "title": "What’s Involved?",
      "subtitle":
          "Drain and flush the water tank to remove sediment. Use instructions to maintain the pipe line.\n\n Check the pressure release valve.\n\n Check the pipeline to identify the leaks.",
    },
  ];
}
