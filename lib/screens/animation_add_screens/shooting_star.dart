import 'dart:async';
import 'dart:math';

import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class ShootingStar extends StatefulWidget {
  const ShootingStar({super.key});

  @override
  State<ShootingStar> createState() => _ShootingStarState();
}

class _ShootingStarState extends State<ShootingStar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (mounted && !_controller.isAnimating) {
        _controller.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: Transform.rotate(
          angle: -pi / 4,
          child: const CustomPaint(
            size: Size(120, 20),
            painter: ShootingPainter(),
          ),
        ),
        builder: (context, child) {
          if (!_controller.isAnimating) return const SizedBox.shrink();

          final progress = _controller.value;
          return Transform.translate(
            offset: Offset(50 + progress * 400, 80 + progress * 250),
            child: Opacity(opacity: 1 - progress, child: child),
          );
        },
      ),
    );
  }
}

class ShootingPainter extends CustomPainter {
  const ShootingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final headPaint = Paint()..color = AppColors.white;
    final trailPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.white, AppColors.transparent],
      ).createShader(const Rect.fromLTWH(0, 0, 100, 2));

    canvas.drawCircle(const Offset(5, 10), 3, headPaint);
    canvas.drawRect(const Rect.fromLTWH(10, 9, 100, 2), trailPaint);
  }

  @override
  bool shouldRepaint(covariant ShootingPainter oldDelegate) => false;
}
