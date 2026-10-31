import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/screens/animation_add_screens/shooting_star.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F1122), Color(0xFF05060F)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Image.asset(
          Assets.png.icBackgroundImage2Png.path,
          filterQuality: FilterQuality.none,
          fit: BoxFit.cover,
        ),
        const RepaintBoundary(child: _StarField()),
        const ShootingStar(),
        const ColoredBox(color: Color(0x80000000)),
      ],
    );
  }
}

class _StarField extends StatelessWidget {
  const _StarField();

  @override
  Widget build(BuildContext context) => const CustomPaint(
    painter: _StarFieldPainter(),
    isComplex: false,
    willChange: false,
  );
}

class _StarFieldPainter extends CustomPainter {
  const _StarFieldPainter();

  // Normalized x/y positions, radius, and base opacity.
  static const _stars = <(double, double, double, double)>[
    (0.07, 0.12, 1.0, 0.45),
    (0.19, 0.24, 1.4, 0.55),
    (0.31, 0.08, 0.9, 0.42),
    (0.45, 0.19, 1.2, 0.5),
    (0.58, 0.11, 0.8, 0.4),
    (0.73, 0.23, 1.3, 0.48),
    (0.88, 0.09, 1.0, 0.44),
    (0.13, 0.39, 0.9, 0.4),
    (0.27, 0.48, 1.2, 0.46),
    (0.42, 0.36, 0.8, 0.38),
    (0.61, 0.45, 1.1, 0.43),
    (0.81, 0.38, 0.9, 0.4),
    (0.94, 0.51, 1.3, 0.48),
    (0.08, 0.64, 1.2, 0.46),
    (0.22, 0.76, 0.8, 0.38),
    (0.38, 0.62, 1.0, 0.42),
    (0.53, 0.83, 1.4, 0.5),
    (0.69, 0.68, 0.9, 0.4),
    (0.85, 0.79, 1.1, 0.44),
    (0.96, 0.91, 0.8, 0.38),
    (0.15, 0.93, 1.0, 0.42),
    (0.34, 0.9, 0.8, 0.36),
    (0.48, 0.52, 0.9, 0.4),
    (0.77, 0.94, 1.2, 0.46),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    for (final (x, y, radius, opacity) in _stars) {
      paint.color = Colors.white.withValues(alpha: opacity);
      canvas.drawCircle(Offset(size.width * x, size.height * y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarFieldPainter oldDelegate) => false;
}
