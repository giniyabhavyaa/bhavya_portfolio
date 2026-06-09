import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}