import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../helpers/AppColors.dart';
import '../../../helpers/styles.dart';

class WhyChooseMeWidget extends StatelessWidget {
  const WhyChooseMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        switch (true) {
          case true when context.isPhone:
            return _mobileView(controller);

          case true when context.isTablet:
            return _tabletView(controller);

          default:
            return _desktopView(controller, context);
        }
      },
    );
  }
  Widget _desktopView(HomeController controller, BuildContext context){
    final isWide = MediaQuery.of(context).size.width > 900;
    return Column(
      children: [
        Text(
          "Why Choose Me",
          style: dmSansW800.copyWith(
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
            style: dmSansW400.copyWith(
              fontSize: 16,
              height: 1.8,
              color: AppColors.colorBCBCBC,
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
                    Colors.white.withValues(alpha: 0.06),
                    Colors.white.withValues(alpha: 0.03),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
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
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    child: Icon(
                      item["icon"],
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
                          item["title"],
                          style: dmSansW700.copyWith(
                            fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(12),
                        Text(
                          item["subtitle"],
                          style: dmSansW400.copyWith(
                            fontSize: 15,
                            color: AppColors.colorBCBCBC,
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
                .fadeIn(
              duration: 500.ms,
              delay: (index * 150).ms,
            )
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

  Widget _tabletView(HomeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 70,
      ),
      child: Column(
        children: [

          Text(
            "Why Choose Me",
            style: dmSansW800.copyWith(
              fontSize: 38,
              color: Colors.white,
            ),
          ),

          const Gap(16),

          SizedBox(
            width: 650,
            child: Text(
              "I focus on building high-quality Flutter applications with clean architecture, scalable code and seamless user experiences.",
              textAlign: TextAlign.center,
              style: dmSansW400.copyWith(
                color: Colors.white70,
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
                  color: Colors.white.withValues(alpha: .04),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .08),
                  ),
                ),
                child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.themeColor.withValues(alpha: .12),
                    ),
                    child: Icon(
                      item["icon"],
                      color: AppColors.themeColor,
                    ),
                  ),

                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item["title"],
                          style: dmSansW700.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            item["subtitle"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: dmSansW400.copyWith(
                              color: Colors.white70,
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

  Widget _mobileView(HomeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            "Why Choose Me",
            style: dmSansW800.copyWith(
              fontSize: 30,
              color: Colors.white,
            ),
          ),

          const Gap(12),

          Text(
            "I focus on building high-quality Flutter applications with clean architecture and scalable code.",
            textAlign: TextAlign.center,
            style: dmSansW400.copyWith(
              color: Colors.white70,
              height: 1.7,
            ),
          ),

          const Gap(40),

          ...List.generate(
            HomeController.features.length,
                (index) {
              final item = HomeController.features[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 18),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white.withValues(alpha: .05),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CircleAvatar(
                      radius: 26,
                      backgroundColor:
                      AppColors.themeColor.withValues(alpha: .15),
                      child: Icon(
                        item["icon"],
                        color: AppColors.themeColor,
                      ),
                    ),

                    const Gap(16),

                    Text(
                      item["title"],
                      style: dmSansW700.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    const Gap(10),

                    Text(
                      item["subtitle"],
                      style: dmSansW400.copyWith(
                        color: Colors.white70,
                        height: 1.6,
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
}