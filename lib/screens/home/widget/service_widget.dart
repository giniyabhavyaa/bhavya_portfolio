import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Services",
          style: dmSansW700.copyWith(fontSize: 28, color: AppColors.white),
        ),
         Gap(30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: const [
            _GlowCard(
              icon: Icons.phone_android,
              title: "📱 Mobile App Development",
              desc: "Building high-performance Flutter apps with smooth user experience.",
            ),
            _GlowCard(
              icon: Icons.api,
              title: "🔗 API Integration & Backend Connectivity",
              desc: "Secure REST API integration with Firebase & backend services.",
            ),
            _GlowCard(
              icon: Icons.design_services,
              title: "🎨 Responsive UI/UX Design",
              desc: "Modern, responsive and visually appealing UI designs for all devices.",
            ),
          ],
        ),
      ],
    ).animate()
        .fadeIn(duration: 500.ms)
        .moveY(begin: 20, end: 0);
  }
}

class _GlowCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _GlowCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.white.withValues(alpha: 0.7),
        boxShadow: [
          BoxShadow(
            color: AppColors.themeColor.withValues(alpha: 0.25),
            blurRadius: 25,
            spreadRadius: 2,
            offset:  Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: AppColors.themeColor),
           Gap(14),
          Text(
            title,
            style: dmSansW600.copyWith(
              fontSize: 20,
              color: AppColors.color1F4B82,
            ),
          ),
          Gap(10),
          Text(
            desc,
            style: dmSansW400.copyWith(
              color: AppColors.color797979,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).animate().fadeIn().moveY(begin: 20);
  }
}