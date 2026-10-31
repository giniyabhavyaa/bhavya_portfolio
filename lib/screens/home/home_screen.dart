import 'package:bhavya_portfolio/base/navigated_button.dart';
import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/home/widget/about_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/animated_background.dart';
import 'package:bhavya_portfolio/screens/home/widget/contact_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/hero_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/projects_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/section_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/service_widget.dart';
import 'package:bhavya_portfolio/screens/home/widget/skills_widget.dart';
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
        final isWide = width >= 1200;
        return Scaffold(
          backgroundColor: AppColors.color0F1122,
          appBar: AppBar(
            backgroundColor: AppColors.color0F1122,
            elevation: 0,
            centerTitle: false,
            title: Text(
              "Bhavya Giniya",
              style: dmSansW800.copyWith(fontSize: 20, color: AppColors.white,fontWeight: FontWeight.bold),
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
              const AnimatedBackground(),
        SingleChildScrollView(
        controller: controller.scrollController,
          child: Column(
            children: [
              SectionWidget(
                controller: controller,
                index: 0,
                child: RepaintBoundary(
                  child: HeroWidget( controller: controller)
                ),
              ),

              SectionWidget(
                controller: controller,
                index: 1,
                child: AboutWidget(isWide: isWide),
              ).animate().fadeIn(duration: 600.ms),
              SectionWidget(
                controller: controller,
                index: 2,
                child: ServiceWidget(),
              ),
              SectionWidget(
                controller: controller,
                index: 3,
                child: ProjectsWidget(),
              ),
              SectionWidget(
                controller: controller,
                index: 4,
                child: SkillsWidget(isWide: isWide),
              ),

              SectionWidget(
                controller: controller,
                index: 5,
                child: WhyChooseMeWidget(),
              ),

              SectionWidget(
                controller: controller,
                index: 6,
                child: ContactWidget(),
              ),
               Gap(40),
              Text(
                "© 2026 • Bhavya Giniya • Flutter Developer",
                style: dmSansW400.copyWith(
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
