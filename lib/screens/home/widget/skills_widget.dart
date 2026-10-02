import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/home/data/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Skills",
          style: dmSansW700.copyWith(fontSize: 28, color: AppColors.white),
        ),
        Gap(30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: HomeData.skills.map((skill) {
            return SkillPill(text: skill)
                .animate()
                .fadeIn(duration: 400.ms)
                .scale(begin: const Offset(0.9, 0.9));
          }).toList(),
        ),
      ],
    );
  }
}

class SkillPill extends StatelessWidget {
  final String text;

  const SkillPill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.color141718.withValues(alpha: 0.6),
        border: Border.all(
          color: AppColors.colorF2F3F6.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.themeColor.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        text,
        style: dmSansW500.copyWith(
          fontSize: 13,
          color: AppColors.white,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
