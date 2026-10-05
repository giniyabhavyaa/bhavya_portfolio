import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/view/base/moons_layer.dart';
import 'package:bhavya_portfolio/view/base/navigated_button.dart';
import 'package:bhavya_portfolio/view/screens/animation_add_screens/shooting_star.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/about_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/contact_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/hero_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/projects_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/section_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/service_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/skills_widget.dart';
import 'package:bhavya_portfolio/view/screens/home/widget/why_me_widget.dart';
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
                 Gap(10),
                Text(
                  "Bhavya Giniya",
                  style: dmSansW800.copyWith(
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
                    padding:  EdgeInsets.all(20),
                    child:  NavigatedButton(isDrawer: true),
                  ),
                ),
          body: Stack(
            children: [
              MoonsLayer(controller: controller),
              const ShootingStar(),
              const Positioned.fill(
                child: ColoredBox(color: Color(0x80000000)),
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