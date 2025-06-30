import 'package:huds/core/exports/exports.dart';

class ManualLocationController extends GetxController {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
