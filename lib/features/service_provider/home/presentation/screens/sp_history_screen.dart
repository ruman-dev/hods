import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/service_provider/home/presentation/controller/service_history_controller.dart';
import 'package:huds/features/service_provider/home/presentation/screens/sp_service_details_screen.dart';
import 'package:huds/features/service_provider/home/presentation/widgets/custom_sp_services.dart';
import 'package:huds/features/user_flow/booking/presentation/components/expanded_list.dart';
import 'package:huds/features/user_flow/booking/presentation/controller/booking_controller.dart';
import 'package:huds/features/user_flow/booking/presentation/screens/cancel_booking.dart';
import 'package:huds/features/user_flow/home/presentation/screens/service_details_screen.dart';

class SpHistoryScreen extends StatelessWidget {
  SpHistoryScreen({super.key});

  final BookingController controller = Get.put(BookingController());
  final _spHistoryController = Get.put(SpHistoryController());

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
                                    return CustomSpServices(
                                      onItemTap:
                                          () =>
                                              Get.to(SpServiceDetailsScreen()),
                                      buttonText: 'Cancel Service',
                                      fontSize: 14.sp,
                                      textColor: Color(0xFF67666B),
                                      backgroundColor: Colors.white,
                                      borderSide: BorderSide(
                                        color: Color(0xFF67666B),
                                        width: 1.5,
                                      ),
                                      isCancelledService: false,
                                      isCompletedService: false,
                                      onUpdatePriceTap: () {
                                        Get.dialog(
                                          AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: SizedBox(
                                              width: double.maxFinite,
                                              height: Get.width * 0.8,
                                              child: Column(
                                                children: [
                                                  CustomPoppinsText(
                                                    text: 'Update Price',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.darkGrey,
                                                  ),
                                                  Gap(20),
                                                  CustomInputField(
                                                    headerTitle:
                                                        'Current Price',
                                                    hintText: '\$22.50',
                                                    textController:
                                                        _spHistoryController
                                                            .currentPrice,
                                                    keyboardType:
                                                        TextInputType.numberWithOptions(
                                                          decimal: true,
                                                        ),
                                                  ),
                                                  Gap(10),
                                                  CustomInputField(
                                                    headerTitle:
                                                        'Updated Price',
                                                    hintText: '\$30.00',
                                                    textController:
                                                        _spHistoryController
                                                            .updatedPrice,
                                                    keyboardType:
                                                        const TextInputType.numberWithOptions(
                                                          decimal: true,
                                                        ),
                                                  ),
                                                  Spacer(),
                                                  CustomButton(
                                                    text: 'Update',
                                                    onPressed: () => Get.back(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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
                            ExpandedList(
                              widgets: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CustomSpServices(
                                      onItemTap: () => SpServiceDetailsScreen(),
                                      isCancelledService: false,
                                      isCompletedService: true,
                                    );
                                  },
                                ),
                              ],
                              index: 1,
                              title: 'Services',
                            ),
                          ],

                          // : Center(
                          //   child: CustomPoppinsText(
                          //     text: 'No bookings found',
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 14.sp,
                          //     color: AppColors.lightGrey,
                          //   ),
                          // ),
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
                            ExpandedList(
                              widgets: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CustomSpServices(
                                      onItemTap:
                                          () => Get.to(ServiceDetailsScreen()),
                                      isCancelledService: true,
                                      isCompletedService: false,
                                    );
                                  },
                                ),
                              ],
                              index: 1,
                              title: 'Requests',
                            ),
                            ExpandedList(
                              widgets: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CustomSpServices(
                                      isCancelledService: true,
                                      isCompletedService: false,
                                    );
                                  },
                                ),
                              ],
                              index: 1,
                              title: 'History',
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
