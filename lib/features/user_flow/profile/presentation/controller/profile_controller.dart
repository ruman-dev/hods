import 'package:get/get.dart';
import 'package:huds/core/app_assets/asset_path.dart';

class ProfileController extends GetxController {
  List<Map<String, dynamic>> profileItems = [
    {'title': 'Edit Profile', 'imgPath': AssetPath.editIcon},
    {'title': 'Support', 'imgPath': AssetPath.verified},
    {'title': 'Privacy', 'imgPath': AssetPath.support},
    {'title': 'Logout', 'imgPath': AssetPath.logout},
  ];
}
