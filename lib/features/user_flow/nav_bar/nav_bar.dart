import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/message/presentation/screens/message_screen.dart';
import 'package:huds/features/user_flow/booking/presentation/screens/booking_screen.dart';
import 'package:huds/features/user_flow/profile/presentation/screens/profile_screen.dart';

class UserNavBar extends StatelessWidget {
  UserNavBar({super.key});

  final RxInt _selectedIndex = 0.obs;

  final List<String> selectedItem = [
    AssetPath.home,
    AssetPath.document,
    AssetPath.chat,
    AssetPath.user,
  ];

  final List<String> unselectedItem = [
    AssetPath.home,
    AssetPath.document,
    AssetPath.chat,
    AssetPath.user,
  ];

  final List<Widget> _screens = [
    UserHomeScreen(),
    BookingScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screens[_selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
          },
          selectedItemColor: AppColors.primaryThemeColor,
          unselectedItemColor: AppColors.lightGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.lightGrey,
          ),
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryThemeColor,
          ),
          items: List.generate(selectedItem.length, (index) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == index
                        ? AppColors.primaryThemeColor
                        : AppColors.lightGrey,
                    BlendMode.srcIn,
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex.value == index
                        ? selectedItem[index]
                        : unselectedItem[index],
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              label: _getLabel(index),
            );
          }),
        );
      }),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'My Booking';
      case 2:
        return 'Message';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
