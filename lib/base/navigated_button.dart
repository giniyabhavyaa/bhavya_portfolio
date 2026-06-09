import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home/controller/home_controller.dart';

class NavigatedButton extends StatelessWidget {
  final bool isDrawer;
  const NavigatedButton({super.key, this.isDrawer = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return isDrawer
            ? Column(
          children: controller.item.asMap().entries.map((entry) {
            return ListTile(
              title: Text(
                entry.value,
                style: dmSansW800.copyWith(fontSize: 15, color: AppColors.white,fontWeight: FontWeight.bold)
              ),
              onTap: () {
                Get.back();
                controller.scrollToSection(entry.key);
              },
            );
          }).toList(),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: controller.item.asMap().entries.map((entry) {
            return TextButton(
              onPressed: () => controller.scrollToSection(entry.key),
              child: Text(
                entry.value,
                style: dmSansW800.copyWith(fontSize: 15, color: AppColors.white,fontWeight: FontWeight.bold)
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
