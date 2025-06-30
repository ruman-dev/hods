import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huds/core/app_colors/app_colors.dart';
import 'package:huds/core/wrapper/custom_poppins_text.dart';
import 'package:huds/features/user_flow/booking/presentation/components/expanded_list.dart';
import 'package:huds/features/user_flow/booking/presentation/controller/booking_controller.dart';
import 'package:huds/features/user_flow/booking/presentation/screens/cancel_booking.dart';
import 'package:huds/features/user_flow/booking/presentation/screens/leave_review_screen.dart';
import 'package:huds/features/user_flow/booking/presentation/widgets/custom_cancelled_item.dart';
import 'package:huds/features/user_flow/booking/presentation/widgets/custom_service.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: CustomPoppinsText(
            text: 'My Booking',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.primaryThemeColor,
            labelColor: AppColors.primaryThemeColor,
            labelStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: Obx(
          () =>
              controller.isLoading.value
                  ? Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: SpinKitCircle(color: AppColors.primaryThemeColor),
                    ),
                  )
                  : TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            // controller.activeBookings.isNotEmpty
                            //     ?
                            ExpandedList(
                              widgets: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CustomCancelledItem(
                                      buttonText: 'Cancel Service',
                                      onBtnTap:
                                          () => Get.to(CancelBookingScreen()),
                                    );
                                  },
                                ),
                              ],
                              index: 2,
                              title: 'Services',
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h),
                            // controller.completedBookings.isNotEmpty
                            //     ? Expanded(
                            //       child:
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ExpandedList(
                                  widgets: [
                                    CustomService(
                                      price: 150,
                                      firstButtonText: 'Leave Review',
                                      secondButtonText: 'Book Again',
                                      onFirstBtnTap:
                                          () => Get.to(LeaveReviewScreen()),
                                    ),
                                  ],
                                  index: index,
                                  title: 'Services',
                                );
                              },
                            ),

                            // : Center(
                            //   child: CustomPoppinsText(
                            //     text: 'No bookings found',
                            //     fontWeight: FontWeight.w400,
                            //     fontSize: 14.sp,
                            //     color: AppColors.lightGrey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h),
                            // controller.completedBookings.isNotEmpty
                            //     ? Expanded(
                            //       child:
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ExpandedList(
                                  widgets: [
                                    CustomCancelledItem(
                                      price: 150,
                                      buttonText: 'Withdraw',
                                    ),
                                  ],
                                  index: index,
                                  title: 'Pending Request',
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ExpandedList(
                                  widgets: [
                                    CustomCancelledItem(
                                      price: 150,
                                      buttonText: 'Cancelled',
                                      textBackgroundColor: Color(0x4D5F60B9),
                                      textColor: AppColors.primaryThemeColor,
                                    ),
                                  ],
                                  index: index,
                                  title: 'History',
                                );
                              },
                            ),

                            // : Center(
                            //   child: CustomPoppinsText(
                            //     text: 'No bookings found',
                            //     fontWeight: FontWeight.w400,
                            //     fontSize: 14.sp,
                            //     color: AppColors.lightGrey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
