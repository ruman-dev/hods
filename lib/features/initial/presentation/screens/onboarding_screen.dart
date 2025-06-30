import 'package:huds/core/exports/exports.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<Map<String, dynamic>> sliderData = [
    {
      'image': AssetPath.onboarding1,
      'title': 'Find Trusted Home Services',
      'subtitle':
          'Say goodbye to stress! Instantly connect with trusted professionals for cleaning, repairs',
    },
    // {
    //   'image': AssetPath.onboarding2,
    //   'title': 'Book Services with Ease',
    //   'subtitle':
    //       'Conveniently browse, schedule, and manage all your home service needs—all in one app.',
    // },
    // {
    //   'image': AssetPath.onboarding3,
    //   'title': 'Track & Rate Your Experience',
    //   'subtitle':
    //       'Stay updated on your bookings in real time and share your feedback to help others.',
    // },
  ];

  final _controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller.pageController,
              itemCount: sliderData.length,
              itemBuilder: (context, index) {
                return SliderModel(
                  image: sliderData[index]['image'],
                  title: sliderData[index]['title'],
                  description: sliderData[index]['subtitle'],
                );
              },
              onPageChanged: _controller.updatePageIndex,
            ),
          ),
          Gap(Get.width * 0.05),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderData.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Gap(Get.width * 0.07),
          Obx(
            () => DashedCircularProgressBar.aspectRatio(
              aspectRatio: 5.5,
              valueNotifier: _controller.valueNotifier,
              animationDuration: Duration(milliseconds: 750),
              progress: _controller.currentIndex.value.toDouble() + 1,
              maxProgress: sliderData.length.toDouble(),
              corners: StrokeCap.round,
              foregroundColor: AppColors.primaryThemeColor,
              backgroundColor: const Color(0x337172CC),
              foregroundStrokeWidth: 6,
              backgroundStrokeWidth: 6,
              animation: true,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (_controller.currentIndex.value ==
                        sliderData.length - 1) {
                      Get.offAllNamed(AppRouteNames().chooseRole);
                    }
                    _controller.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.primaryThemeColor,
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(Get.width * 0.08),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      height: 8,
      width: _controller.currentIndex.value == index ? 30 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            _controller.currentIndex.value == index
                ? AppColors.primaryThemeColor
                : Color(0x4D7172CC),
      ),
      duration: const Duration(milliseconds: 150),
    );
  }
}
