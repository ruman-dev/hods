import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/select_worker_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/review_screen.dart';

class SelectWorkerScreen extends StatelessWidget {
  SelectWorkerScreen({super.key});

  final _workerController = Get.put(SelectWorkerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(titleWidget: CustomAppTitle(title: 'Select Worker')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F8FE),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Obx(
                  () => Row(
                    children: [
                      GenderWidget(
                        title: 'Man',
                        onTap: () => _workerController.selectedGender.value = 0,
                        selectedIndex: _workerController.selectedGender.value,
                        genderIndex: 0,
                      ),
                      Gap(20),
                      GenderWidget(
                        title: 'Woman',
                        onTap: () => _workerController.selectedGender.value = 1,
                        selectedIndex: _workerController.selectedGender.value,
                        genderIndex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPoppinsText(
                  text: 'Professional (12)',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 67,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/5a1dcd03cc0c246a54cf6363baa7cb5caf474b36',
                              ),
                            ),
                          ),
                        ),
                        Gap(15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPoppinsText(
                                text: 'Wade Warren',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: Color(0xFFFACC15),
                                  ),
                                  CustomPoppinsText(
                                    text: '4.4',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFACC15),
                                  ),
                                  Gap(6),
                                  CustomPoppinsText(
                                    text: '(532)',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                              Gap(3),
                              Row(
                                children: [
                                  CustomPoppinsText(
                                    text: '\$50',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGrey,
                                  ),
                                  Gap(5),
                                  CustomPoppinsText(
                                    text: 'Starting price',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _workerController.selectedWorker.value = index;
                          },
                          child: Obx(
                            () => Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryThemeColor,

                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                color:
                                    _workerController.selectedWorker.value ==
                                            index
                                        ? AppColors.primaryThemeColor
                                        : Colors.white,
                              ),
                              child: CustomPoppinsText(
                                text:
                                    _workerController.selectedWorker.value ==
                                            index
                                        ? 'Selected'
                                        : 'Select +',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                    _workerController.selectedWorker.value ==
                                            index
                                        ? Colors.white
                                        : AppColors.primaryThemeColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              CustomButton(
                text: 'Continue',
                onPressed: () => Get.to(ReviewScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.selectedIndex,
    required this.genderIndex,
  });

  final void Function() onTap;
  final String title;
  final int selectedIndex;
  final int genderIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                selectedIndex == genderIndex ? Colors.white : Color(0xFFF6F8FE),
            borderRadius: BorderRadius.circular(25),
          ),
          child: CustomPoppinsText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
