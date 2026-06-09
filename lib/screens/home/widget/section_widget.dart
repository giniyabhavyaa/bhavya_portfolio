import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.index,
    required this.child,
    required this.controller
  });

  final int index;
  final Widget child;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      key: controller.sectionKeys[index],
      child: child,
    );
  }
}
