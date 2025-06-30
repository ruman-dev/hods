import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/models/question_model.dart';
import 'package:huds/features/user_flow/home/presentation/screens/service_details_screen.dart';

class QuestionController extends GetxController {
  var questionIndex = 0.obs;
  var selectedAns = ''.obs;
  var selectedRes = [].obs;

  final RxList<QuestionModel> questions =
      [
        QuestionModel(
          id: 1,
          title: 'What plumbing issue are you having?',
          options: [
            'Need to install/replace a fixture',
            'Leaking pipe/faucet',
            'Clogged drain/toilet',
            'Other',
          ],
        ),
        QuestionModel(
          id: 2,
          title: 'What type of repair do you need?',
          options: [
            'Faucets or pipes',
            'water heater',
            'clear a drain or blockage',
            'shower or bathtub',
          ],
        ),
        QuestionModel(
          id: 3,
          title: 'What type of bathroom fixture do you need installed?',
          options: ['Shower', 'Bathtab'],
        ),
        QuestionModel(
          id: 4,
          title: 'How can we help with your shower?',
          options: ['Install New', 'Replace Existing', 'Fixtures Only'],
        ),
      ].obs;
  @override
  void onInit() {
    super.onInit();
    selectedRes.value = List.filled(questions.length, -1);
  }

  void onOptionSelected(int optionIndex) {
    selectedRes[questionIndex.value] = optionIndex;
  }

  void onIncrementIndex() {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
    } else {
      Get.to(ServiceDetailsScreen());
    }
  }
}
