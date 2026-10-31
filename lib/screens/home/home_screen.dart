import 'package:bhavya_portfolio/base/navigated_button.dart';
import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/screens/home/widget/about_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/animated_background.dart';
import 'package:bhavya_portfolio/screens/home/widget/contact_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/hero_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/projects_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/section_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/service_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/skills_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/why_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        final isWide = MediaQuery.sizeOf(context).width >= 1200;

        return Scaffold(
          backgroundColor: AppColors.color0F1122,
          appBar: AppBar(
            backgroundColor: AppColors.color0F1122,
            elevation: 0,
            centerTitle: false,
            title: Text(
              'Bhavya Giniya',
              style: dmSansW200.copyWith(fontSize: 20, color: AppColors.white),
            ),
            actions: isWide ? [const NavigatedButton()] : null,
          ),
          drawer: isWide
              ? null
              : const Drawer(
                  backgroundColor: AppColors.color15172D,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: NavigatedButton(isDrawer: true),
                  ),
                ),
          body: Stack(
            children: [
              const AnimatedBackground(),
              SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    SectionWidget(
                      index: 0,
                      child: const RepaintBoundary(child: HeroWidget()),
                    ),
                    SectionWidget(
                      index: 1,
                      child: AboutWidget(isWide: isWide),
                    ).animate().fadeIn(duration: 600.ms),
                    const SectionWidget(index: 2, child: ServiceWidget()),
                    const SectionWidget(index: 3, child: ProjectsWidget()),
                    const SectionWidget(index: 4, child: SkillsWidget()),
                    const SectionWidget(index: 5, child: WhyChooseMeWidget()),
                    const SectionWidget(index: 6, child: ContactWidget()),
                    const Gap(40),
                    Text(
                      '© 2026 • Bhavya Giniya • Flutter Developer',
                      style: dmSansW200.copyWith(
                        fontSize: 14,
                        color: AppColors.colorBCBCBC,
                      ),
                    ),
                    const Gap(40),
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
