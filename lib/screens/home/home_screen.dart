import 'dart:math';
import 'package:bhavya_portfolio/base/navigated_button.dart';
import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/home/widget/about_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/contact_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/hero_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/projects_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/section_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/service_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/skills_widget.dart';
import 'package:bhavya_portfolio/screens/animation_add_screens/shooting_star.dart';
import 'package:bhavya_portfolio/screens/home/widget/why_me_widget.dart';
import 'package:bhavya_portfolio/screens/home/data/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        final width = MediaQuery.of(context).size.width;
        final isWide = width > 1200;
        final staticMoons = HomeData.moons.map((moon) {
          return Container(
            width: moon.size,
            height: moon.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.white.withValues(alpha: 0.12),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Image.asset(
              Assets.png.icMoon.path,
              filterQuality: FilterQuality.low,
            ),
          );
        }).toList();

        return Scaffold(
          backgroundColor: AppColors.color0F1122,
          appBar: AppBar(
            backgroundColor: AppColors.color0F1122,
            elevation: 0,
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.themeColor,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.png.icImage.path,
                      width: 34,
                      height: 34,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
                const Gap(10),
                Text(
                  "Bhavya Giniya",
                  style: dmSansW200.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: isWide ? [const NavigatedButton()] : null,
          ),
          drawer: isWide
              ? null
              : Drawer(
                  backgroundColor: AppColors.color15172D,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: const NavigatedButton(isDrawer: true),
                  ),
                ),
          body: Stack(
            children: [
              Positioned.fill(
                child: RepaintBoundary(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.color0F1122,
                              AppColors.color05060F,
                            ],
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
                    ],
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: Listenable.merge([
                  controller.scrollController,
                  controller.floatController,
                ]),
                builder: (_, __) {
                  final scrollOffset = controller.scrollController.hasClients
                      ? controller.scrollController.offset
                      : 0;
                  final t = controller.floatController.value;
                  final screenWidth = MediaQuery.of(context).size.width;

                  return Stack(
                    children: HomeData.moons.map((moon) {
                      final phase = moon.index * 0.7;
                      final floatY = sin((t * 2 * pi) + phase) * 6;
                      final floatX = cos((t * 2 * pi) + phase) * 4;
                      final scrollY = scrollOffset * moon.speed * 0.08;
                      final driftX = scrollOffset * moon.speed * 0.01;
                      final baseX =
                          (screenWidth / (HomeData.moons.length + 1)) *
                          (moon.index + 1);
                      final top = 160 + (moon.index * 100) + floatY + scrollY;
                      final left = baseX + floatX + driftX - (moon.size / 2);

                      final scale = 0.95 + (sin((t * 2 * pi) + phase) * 0.03);

                      return Positioned(
                        top: top,
                        left: left,
                        child: Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: 0.7 + (moon.speed * 0.5),
                            child: RepaintBoundary(
                              child: staticMoons[moon.index],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const ShootingStar(),
              Positioned.fill(
                child: ColoredBox(
                  color: AppColors.black.withValues(alpha: 0.5),
                ),
              ),
              SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    const SectionWidget(
                      index: 0,
                      child: RepaintBoundary(child: HeroWidget()),
                    ),

                    SectionWidget(
                      index: 1,
                      child: AboutWidget(isWide: isWide),
                    ).animate().fadeIn(duration: 600.ms),
                    const SectionWidget(index: 2, child: ServiceWidget()),
                    const SectionWidget(index: 3, child: ProjectsWidget()),
                    SectionWidget(index: 4, child: SkillsWidget()),

                    const SectionWidget(index: 5, child: WhyChooseMeWidget()),

                    const SectionWidget(index: 6, child: ContactWidget()),
                    Gap(40),
                    Text(
                      "© 2026 • Bhavya Giniya • Flutter Developer",
                      style: dmSansW200.copyWith(
                        fontSize: 14,
                        color: AppColors.colorBCBCBC,
                      ),
                    ),
                    Gap(40),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
