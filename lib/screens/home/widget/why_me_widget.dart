import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/utils/extension.dart';
import 'package:bhavya_portfolio/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/styles.dart';

class WhyChooseMeWidget extends StatelessWidget {
  const WhyChooseMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    switch (context.deviceType) {
      case DeviceType.mobile:
        return _mobileView();

      case DeviceType.tablet:
        return _tabletView();

      case DeviceType.desktop:
        return _desktopView(context);
    }
  }

  Widget _desktopView(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;
    return Column(
      children: [
        Text(
          "Why Choose Me",
          style: dmSansW200.copyWith(
            fontSize: isWide ? 42 : 30,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            "I focus on building high-quality Flutter applications with clean architecture, scalable code, and seamless user experiences.",
            textAlign: TextAlign.center,
            style: dmSansW200.copyWith(
              fontSize: 16,
              height: 1.8,
              color: AppColors.white.withValues(alpha: .9),
            ),
          ),
        ),
        const Gap(60),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomeController.features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isWide ? 3.2 : 1.9,
          ),
          itemBuilder: (context, index) {
            final item = HomeController.features[index];

            return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.white.withValues(alpha: 0.06),
                        AppColors.white.withValues(alpha: 0.03),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.08),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.18),
                        blurRadius: 24,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.08),
                        ),
                        child: Icon(
                          item.icon,
                          size: 30,
                          color: AppColors.white,
                        ),
                      ),

                      Gap(20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: dmSansW200.copyWith(
                                fontSize: 20,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(12),
                            Text(
                              item.description,
                              style: dmSansW200.copyWith(
                                fontSize: 15,
                                color: AppColors.white.withValues(alpha: .9),
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: (index * 150).ms)
                .moveY(
                  begin: 40,
                  end: 0,
                  duration: 500.ms,
                  delay: (index * 150).ms,
                );
          },
        ),
      ],
    );
  }

  Widget _tabletView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
      child: Column(
        children: [
          Text(
            "Why Choose Me",
            style: dmSansW200.copyWith(fontSize: 38, color: AppColors.white),
          ),

          const Gap(16),

          SizedBox(
            width: 650,
            child: Text(
              "I focus on building high-quality Flutter applications with clean architecture, scalable code and seamless user experiences.",
              textAlign: TextAlign.center,
              style: dmSansW200.copyWith(
                color: AppColors.white.withValues(alpha: .9),
                height: 1.7,
              ),
            ),
          ),

          const Gap(50),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: HomeController.features.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              final item = HomeController.features[index];

              return Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.white.withValues(alpha: .04),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: .08),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.themeColor.withValues(alpha: .12),
                      ),
                      child: Icon(item.icon, color: AppColors.themeColor),
                    ),

                    const Gap(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.title,
                            style: dmSansW200.copyWith(
                              color: AppColors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              item.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: dmSansW200.copyWith(
                                color: AppColors.white.withValues(alpha: .9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _mobileView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            "Why Choose Me",
            style: dmSansW200.copyWith(fontSize: 30, color: AppColors.white),
          ),

          const Gap(12),

          Text(
            "I focus on building high-quality Flutter applications with clean architecture and scalable code.",
            textAlign: TextAlign.center,
            style: dmSansW200.copyWith(
              color: AppColors.white.withValues(alpha: .9),
              height: 1.7,
            ),
          ),

          const Gap(40),

          ...List.generate(HomeController.features.length, (index) {
            final item = HomeController.features[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: AppColors.white.withValues(alpha: .05),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: .08),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.themeColor.withValues(
                      alpha: .15,
                    ),
                    child: Icon(item.icon, color: AppColors.themeColor),
                  ),

                  const Gap(16),

                  Text(
                    item.title,
                    style: dmSansW200.copyWith(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),

                  const Gap(10),

                  Text(
                    item.description,
                    style: dmSansW200.copyWith(
                      color: AppColors.white.withValues(alpha: .9),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
