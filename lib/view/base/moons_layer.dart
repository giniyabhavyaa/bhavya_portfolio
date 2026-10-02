import 'dart:math';

import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/view/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/view/screens/home/data/home_data.dart';
import 'package:flutter/material.dart';

class MoonsLayer extends StatelessWidget {
  const MoonsLayer({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final count = HomeData.moons.length;

    return Stack(
      children: [
        for (final moon in HomeData.moons)
          Positioned(
            left: (screenWidth / (count + 1)) * (moon.index + 1) - moon.size / 2,
            top: 160.0 + moon.index * 100,
            child: AnimatedBuilder(
              animation: Listenable.merge([
                controller.scrollController,
                controller.floatController,
              ]),
              child: RepaintBoundary(
                child: SizedBox(
                  width: moon.size,
                  height: moon.size,
                  child: Image.asset(
                    Assets.png.icMoon.path,
                    filterQuality: FilterQuality.low,
                    cacheWidth: (moon.size * 2).toInt(),
                    // Opacity widget ne badle image ma j opacity
                    opacity: AlwaysStoppedAnimation(
                      (0.7 + moon.speed * 0.5).clamp(0.0, 1.0),
                    ),
                  ),
                ),
              ),
              builder: (_, child) {
                final t = controller.floatController.value;
                final phase = moon.index * 0.7;
                final angle = t * 2 * pi + phase;
                final offset = controller.scrollController.hasClients
                    ? controller.scrollController.offset
                    : 0.0;

                final dx = cos(angle) * 4 + offset * moon.speed * 0.01;
                final dy = sin(angle) * 6 + offset * moon.speed * 0.08;

                return Transform.translate(
                  offset: Offset(dx, dy),
                  child: Transform.scale(
                    scale: 0.95 + sin(angle) * 0.03,
                    child: child,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}