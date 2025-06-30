import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/question_controller.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key, required this.serviceTitle});

  final String serviceTitle;

  final _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leading: true,
        titleWidget: CustomAppTitle(title: serviceTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Obx(
                () => LinearProgressIndicator(
                  value:
                      _questionController.questionIndex /
                      _questionController.questions.length,
                  color: AppColors.primaryThemeColor,
                  backgroundColor: Color(0xFFe8e7e9),
                  borderRadius: BorderRadius.circular(12),
                  minHeight: 8,
                ),
              ),
              Gap(Get.width * 0.1),
              Obx(
                () => CustomPoppinsText(
                  text:
                      _questionController
                          .questions[_questionController.questionIndex.value]
                          .title,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() {
                final currentQuestion =
                    _questionController.questions[_questionController
                        .questionIndex
                        .value];
                final selectedIndex =
                    _questionController.selectedRes[_questionController
                        .questionIndex
                        .value];

                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: currentQuestion.options.length,
                  itemBuilder: (context, index) {
                    final option = currentQuestion.options[index];
                    return RadioListTile<int>(
                      activeColor: AppColors.darkGrey,
                      contentPadding: EdgeInsets.zero,
                      title: CustomPoppinsText(
                        text: option,
                        color: AppColors.lightGrey,
                      ),
                      value: index,
                      groupValue: selectedIndex,
                      onChanged: (value) {
                        _questionController.onOptionSelected(value!);
                      },
                    );
                  },
                );
              }),
              Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () => _questionController.onIncrementIndex(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
