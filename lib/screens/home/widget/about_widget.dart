import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key, required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isWide ? 800 : double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 36 : 28,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.themeColor.withValues(alpha: 0.25),
            blurRadius: 60,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            "About Me",
            style: dmSansW800.copyWith(
              fontSize: isWide ? 32 : 26,
              color: AppColors.white,
            ),
          ),

          Gap(18),

          Text(
            "A Flutter Developer who builds modern mobile & web apps with clean architecture, "
                "GetX state management, animations, API integration, Firebase and "
                "pixel-perfect responsive UI.",
            style: dmSansW400.copyWith(
              fontSize: isWide ? 17 : 15,
              color: AppColors.color797979,
              height: 1.6,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .scale(begin: const Offset(0.95, 0.95));
  }
}
