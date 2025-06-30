import 'package:huds/core/exports/exports.dart';
import 'package:huds/features/user_flow/home/presentation/controller/search_controller.dart';
import 'package:huds/features/user_flow/home/presentation/screens/services_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({super.key});

  final _searchController = Get.put(SearchViewController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: Get.width * 1.5,
        child: Column(
          children: [
            Container(
              height: 4,
              width: Get.width * 0.1,
              decoration: BoxDecoration(
                color: Color(0xFFE3E9ED),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 10),
            CustomPoppinsText(
              text: 'Filter By',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPoppinsText(
                  text: 'Price',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                CustomPoppinsText(
                  text: '\$0-\$80',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                ),
              ],
            ),
            rangeSlider(),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomPoppinsText(
                text: 'Service Type',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            ServiceTypeWidget(
              title: 'Handyman',
              isChecked: _searchController.serviceType1,
              onTap: (value) => _searchController.toggleCheckbox(value!, 0),
            ),
            ServiceTypeWidget(
              title: 'Spa & wellness',
              isChecked: _searchController.serviceType2,
              onTap: (value) => _searchController.toggleCheckbox(value!, 1),
            ),
            ServiceTypeWidget(
              title: 'Mobile Health',
              isChecked: _searchController.serviceType3,
              onTap: (value) => _searchController.toggleCheckbox(value!, 2),
            ),
            ServiceTypeWidget(
              title: 'Hair & beauty',
              isChecked: _searchController.serviceType4,
              onTap: (value) => _searchController.toggleCheckbox(value!, 3),
            ),
            ServiceTypeWidget(
              title: 'Home repairs',
              isChecked: _searchController.serviceType5,
              onTap: (value) => _searchController.toggleCheckbox(value!, 4),
            ),
            ServiceTypeWidget(
              title: 'Home cleaning',
              isChecked: _searchController.serviceType6,
              onTap: (value) => _searchController.toggleCheckbox(value!, 5),
            ),
            Gap(15),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomPoppinsText(
                text: 'Ratings',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ..._searchController.ratingText.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;

                  return Obx(
                    () => RatingItem(
                      item: item,
                      isSelected:
                          _searchController.selectedIndex.value == index,
                      onTap: () {
                        _searchController.selectedIndex.value = index;
                      },
                    ),
                  );
                }),
              ],
            ),

            Gap(Get.width * 0.07),
            CustomButton(
              text: 'Apply Filter',
              onPressed: () => Get.to(ServicesScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget rangeSlider() {
    return Obx(
      () => SfRangeSlider(
        min: 0.0,
        max: 500.0,
        values: _searchController.values.value,
        interval: 100,
        showTicks: false,
        showLabels: false,
        enableTooltip: true,
        activeColor: AppColors.primaryThemeColor,
        minorTicksPerInterval: 1,
        tooltipTextFormatterCallback: (dynamic value, String formattedText) {
          return '\$${value.toInt()}';
        },
        onChanged: (SfRangeValues newValues) {
          _searchController.values.value = newValues;
        },
      ),
    );
  }
}

class RatingItem extends StatelessWidget {
  const RatingItem({
    super.key,
    required this.item,
    this.onTap,
    required this.isSelected,
  });

  final String item;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.primaryThemeColor.withValues(alpha: 0.1)
                  : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryThemeColor : Color(0xFFE3E3E9),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.star_rounded, color: Color(0xFFFFC72C)),
            Gap(5),
            CustomPoppinsText(text: item),
          ],
        ),
      ),
    );
  }
}

class ServiceTypeWidget extends StatelessWidget {
  const ServiceTypeWidget({super.key, this.title, this.isChecked, this.onTap});

  final String? title;
  final RxBool? isChecked;
  final void Function(bool?)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPoppinsText(
          text: title ?? '',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGrey,
        ),
        Obx(
          () => Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: isChecked?.value ?? true,
            activeColor: AppColors.primaryThemeColor,
            onChanged: onTap,
          ),
        ),
      ],
    );
  }
}
