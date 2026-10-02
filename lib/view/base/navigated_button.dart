import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home/controller/home_controller.dart';
import '../screens/home/data/home_data.dart';

class NavigatedButton extends StatelessWidget {
  final bool isDrawer;
  const NavigatedButton({super.key, this.isDrawer = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return isDrawer
        ? Column(
            children: HomeData.navigationItems.map((item) {
              return ListTile(
                title: Text(
                  item.title,
                  style: dmSansW800.copyWith(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Get.back();
                  controller.scrollToSection(item.sectionIndex);
                },
              );
            }).toList(),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: HomeData.navigationItems.map((item) {
              return TextButton(
                onPressed: () => controller.scrollToSection(item.sectionIndex),
                child: Text(
                  item.title,
                  style: dmSansW800.copyWith(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          );
  }
}
