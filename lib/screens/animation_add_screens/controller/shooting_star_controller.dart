import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShootingStarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;

  final random = Random();

  @override
  void onInit() {
    super.onInit();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    startAnimationLoop();
  }

  void startAnimationLoop() async {
    while (true) {
      await Future.delayed(
        Duration(seconds: random.nextInt(4) + 2),
      );

      if (controller.isAnimating) continue;

      controller.forward(from: 0);
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}