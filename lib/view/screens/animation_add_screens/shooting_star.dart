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
        child: CustomPaint(
          size: const Size(120, 20),
          painter: ShootingPainter(controller),
        ),
      ),
    );
  }
}

class ShootingPainter extends CustomPainter {
  ShootingPainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  static final _headPaint = Paint();
  static final _trailPaint = Paint();
  static final _trailShader = const LinearGradient(
    colors: [Colors.white, Colors.transparent],
  ).createShader(
    const Rect.fromLTWH(10, 9, 100, 2),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final t = animation.value;
    canvas.save();
    canvas.translate(50 + t * 400, 80 + t * 250);
    canvas.rotate(-pi / 4);

    _headPaint.color = Colors.white.withValues(alpha: 1 - t);
    _trailPaint
      ..color = Colors.white.withValues(alpha: 1 - t)
      ..shader = _trailShader;
    canvas.drawCircle(const Offset(5, 10), 3, _headPaint);
    canvas.drawRect(const Rect.fromLTWH(10, 9, 100, 2), _trailPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
