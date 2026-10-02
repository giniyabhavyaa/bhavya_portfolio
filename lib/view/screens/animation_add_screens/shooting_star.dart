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
  late final AnimationController controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (mounted) controller.forward(from: 0);
    });
    controller.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: controller,
          child: Transform.rotate(
            angle: -pi / 4,
            child: const CustomPaint(
              size: Size(120, 20),
              painter: ShootingPainter(),
            ),
          ),
          builder: (_, child) {
            final t = controller.value;
            return Transform.translate(
              offset: Offset(50 + t * 400, 80 + t * 250),
              child: Opacity(opacity: 1 - t, child: child),
            );
          },
        ),
      ),
    );
  }
}

class ShootingPainter extends CustomPainter {
  const ShootingPainter();

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


