import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppbar({
    super.key,
    this.centerTitle,
    this.titleWidget,
    this.leading,
  });

  final bool? centerTitle;
  final Widget? titleWidget;
  final bool? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: centerTitle ?? true,
      automaticallyImplyLeading: leading ?? true,
      title: titleWidget,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.06);
}
