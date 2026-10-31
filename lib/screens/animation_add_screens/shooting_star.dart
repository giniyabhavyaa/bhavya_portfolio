import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ShootingStar extends StatefulWidget {
  const ShootingStar({super.key});

  @override
  State<ShootingStar> createState() => _ShootingStarState();
}

class _ShootingStarState extends State<ShootingStar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (mounted && !controller.isAnimating) {
        controller.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (!controller.isAnimating) {
            return const SizedBox.shrink();
          }
          final t = controller.value;
          final progress = t;

          return Transform.translate(
            offset: Offset(50 + (progress * 400), 80 + (progress * 250)),
            child: Opacity(
              opacity: 1 - t,
              child: Transform.rotate(
                angle: -pi / 4,
                child: CustomPaint(
                  size: const Size(120, 20),
                  painter: ShootingPainter(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShootingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final headPaint = Paint()..color = Colors.white;

    final trailPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.white, Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, 100, 2));

    canvas.drawCircle(const Offset(5, 10), 3, headPaint);

    canvas.drawRect(const Rect.fromLTWH(10, 9, 100, 2), trailPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
