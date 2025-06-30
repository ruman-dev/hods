import 'package:carousel_slider/carousel_slider.dart';
import 'package:huds/features/user_flow/home/presentation/controller/user_home_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/category_screen.dart';
import 'package:huds/features/user_flow/home/presentation/screens/notification_screen.dart';
import 'package:huds/features/user_flow/home/presentation/screens/search_screen.dart';
import 'package:huds/features/user_flow/home/presentation/screens/services_screen.dart';
import 'package:huds/features/user_flow/home/presentation/widgets/category_item.dart';

import '../../../../../core/exports/exports.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final _controller = Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.width * 0.76,
              child: Stack(
                children: [
                  SizedBox(
                    height: Get.width * 0.65,
                    child: ClipRRect(
                      child: CarouselSlider.builder(
                        itemCount: _controller.images.length,
                        itemBuilder: (context, index, realIndex) {
                          return Image.network(
                            _controller.images[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                        options: CarouselOptions(
                          height: 350,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          enlargeCenterPage: false,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {
                            _controller.currentPage.value = index;
                          },
                        ),
                      ),
                    ),
                  ),

                  //* Notification Icon
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Get.to(NotificationScreen()),
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.9,
                            ),
                            child: Icon(
                              Icons.notifications_none,
                              color: AppColors.primaryThemeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //* Page indicator dots
                  Obx(
                    () => Positioned(
                      top: Get.width * 0.53,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_controller.images.length, (
                          index,
                        ) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width:
                                _controller.currentPage.value == index ? 25 : 8,
                            decoration: BoxDecoration(
                              color:
                                  _controller.currentPage.value == index
                                      ? Colors.white
                                      : Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  //* Bottom Info Card
                  Positioned(
                    top: Get.width * 0.54,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 16.0,
                              top: 16,
                              bottom: 16,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AssetPath.location_2),
                                SizedBox(width: 8),
                                Expanded(
                                  child: CustomPoppinsText(
                                    text: "1901 Thornridge Cir. Shiloha",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    color: Color(0xFF6C757D),
                                  ),
                                ),
                                Icon(
                                  Icons.my_location_outlined,
                                  color: Color(0xFF6C757D),
                                ),
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () => Get.to(SearchScreen()),
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.search_outlined,
                              color: AppColors.primaryThemeColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  serviceType(
                    title: 'Category',
                    onTap: () => Get.to(CategoryScreen()),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        _controller.categoryImages.length >= 6
                            ? 6
                            : _controller.categoryImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        categoryImg:
                            _controller.categoryImages[index]['image']!,
                        title: _controller.categoryImages[index]['title']!,
                      );
                    },
                  ),
                  Gap(20),
                  serviceType(
                    title: 'Services',
                    onTap: () => Get.to(ServicesScreen()),
                  ),
                  Gap(15),
                  SizedBox(
                    height: Get.width * 0.75,
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width * 0.7,
                          padding: const EdgeInsets.only(right: 10),
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.white,
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 300,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/9d4f49bb531356228f9e6f2239d3602e6e76b9fa',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: Get.width * 0.04,
                                          left: Get.width * 0.04,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: CustomPoppinsText(
                                              text: 'Painting',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  AppColors.primaryThemeColor,
                                              isUppercase: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFFFBD00),
                                            size: 25,
                                          ),
                                          Gap(5),
                                          CustomPoppinsText(
                                            text: '4.3',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: CustomPoppinsText(
                                        text: 'Painting for beautiful Homes',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF1C1F34),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundImage: NetworkImage(
                                              'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/a8e46105b4a4bca76930699a0ff5a851a382d8a6',
                                            ),
                                          ),
                                          Gap(10),
                                          CustomPoppinsText(
                                            text: 'Wade Warren',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: Get.width * 0.325,
                                right: Get.width * 0.05,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryThemeColor,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                  child: CustomPoppinsText(
                                    text: '₹150',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    isUppercase: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  SizedBox(
                    height: Get.width * 0.5,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: Get.width * 0.65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: CarouselSlider.builder(
                              itemCount: _controller.images.length,
                              itemBuilder: (context, index, realIndex) {
                                return Image.network(
                                  _controller.images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              },
                              options: CarouselOptions(
                                height: 350,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 2),
                                enlargeCenterPage: false,
                                viewportFraction: 1.0,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  _controller.bottomCurrentPage.value = index;
                                },
                              ),
                            ),
                          ),
                        ),

                        //* Page indicator dots
                        Obx(
                          () => Positioned(
                            top: Get.width * 0.45,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _controller.images.length,
                                (index) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    height: 8,
                                    width:
                                        _controller.bottomCurrentPage.value ==
                                                index
                                            ? 25
                                            : 8,
                                    decoration: BoxDecoration(
                                      color:
                                          _controller.bottomCurrentPage.value ==
                                                  index
                                              ? Colors.white
                                              : Colors.white54,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  serviceType(title: 'Featured', onTap: () {}),
                  Gap(15),
                  SizedBox(
                    height: Get.width * 0.75,
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width * 0.5,
                          padding: const EdgeInsets.only(right: 10),
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.white,
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 300,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/63b8a21dd3be5b743a5063d1ef37e4a20c0c7a77',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: Get.width * 0.04,
                                          left: Get.width * 0.04,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: CustomPoppinsText(
                                              text: 'Fixing',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  AppColors.primaryThemeColor,
                                              isUppercase: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFFFBD00),
                                            size: 25,
                                          ),
                                          Gap(5),
                                          CustomPoppinsText(
                                            text: '4.3',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: CustomPoppinsText(
                                        text: 'Painting for Home',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF1C1F34),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundImage: NetworkImage(
                                              'https://www.figma.com/file/sHnVukGHy7BpgqPnHoqhIQ/image/a11e7d2de518a94318f0ba279cf5b43afcf47fc7',
                                            ),
                                          ),
                                          Gap(10),
                                          CustomPoppinsText(
                                            text: 'Esther Howard',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.lightGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: Get.width * 0.33,
                                right: Get.width * 0.05,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryThemeColor,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                  child: CustomPoppinsText(
                                    text: '₹150',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    isUppercase: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget serviceType({required String title, required void Function() onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomPoppinsText(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGrey,
      ),
      GestureDetector(
        onTap: onTap,
        child: CustomPoppinsText(
          text: 'View All',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGrey,
        ),
      ),
    ],
  );
}
