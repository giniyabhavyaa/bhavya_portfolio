import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/model/service_model.dart';
import 'package:bhavya_portfolio/view/screens/home/data/home_data.dart';
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
          children: HomeData.services
              .map((service) => _GlowCard(service: service))
              .toList(),
        ),
      ],
    ).animate().fadeIn(duration: 500.ms).moveY(begin: 20, end: 0);
  }
}

class _GlowCard extends StatelessWidget {
  const _GlowCard({required this.service});

  final ServiceModel service;

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
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(service.icon, size: 40, color: AppColors.themeColor),
          Gap(14),
          Text(
            service.title,
            style: dmSansW600.copyWith(
              fontSize: 20,
              color: AppColors.color1F4B82,
            ),
          ),
          Gap(10),
          Text(
            service.description,
            style: dmSansW400.copyWith(
              color: AppColors.color797979,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
