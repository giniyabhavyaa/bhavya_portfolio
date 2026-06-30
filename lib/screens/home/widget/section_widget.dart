import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      key: controller.sectionKeys[index],
      child: child,
    );
  }
}
