import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/glass_card/glass_card.dart';
import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:bhavya_portfolio/utils/utility.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktopScreen) {
      return _featuredProjectDesktop();
    }

    if (context.isTabletScreen) {
      return _featuredProjectTablet();
    }

    return _featuredProjectMobile();
  }

  Widget _featuredProjectDesktop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Projects",
              style: dmSansW200.copyWith(fontSize: 28, color: AppColors.white),
            ),
          ),
          const Gap(40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  AppColors.themeColor.withValues(alpha: .18),
                  AppColors.color141718.withValues(alpha: .4),
                ],
              ),
              border: Border.all(
                color: AppColors.themeColor.withValues(alpha: .3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("🚀", style: dmSansW200.copyWith(fontSize: 28)),
                    const Gap(10),
                    Text(
                      "Featured Project",
                      style: dmSansW200.copyWith(
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Text(
                  HomeController.featuredProject.title,
                  style: dmSansW200.copyWith(
                    fontSize: 32,
                    color: AppColors.themeColor,
                  ),
                ),
                const Gap(12),
                Text(
                  HomeController.featuredProject.subtitle,
                  style: dmSansW200.copyWith(
                    fontSize: 16,
                    color: AppColors.colorF6F6F6.withValues(alpha: .95),
                    height: 1.6,
                  ),
                ),
                const Gap(18),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: HomeController.featuredProject.techStack.map((
                    tech,
                  ) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.themeColor.withValues(alpha: .15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech,
                        style: dmSansW200.copyWith(color: AppColors.themeColor),
                      ),
                    );
                  }).toList(),
                ),
                const Gap(20),
                Text(
                  HomeController.featuredProject.result,
                  style: dmSansW200.copyWith(
                    fontSize: 15,
                    color: AppColors.white.withValues(alpha: .9),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Gap(24),
                Row(
                  children: [
                    if (HomeController.featuredProject.youtube != null)
                      ElevatedButton.icon(
                        onPressed: () => Utility.launchExternalUrl(
                          HomeController.featuredProject.youtube!,
                        ),
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: AppColors.white,
                        ),
                        label: const Text("Watch Demo"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorFF0000,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 16,
                          ),
                        ),
                      ),
                    const Gap(14),
                    if (HomeController.featuredProject.githubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () => Utility.launchExternalUrl(
                          HomeController.featuredProject.githubUrl!,
                        ),
                        icon: const Icon(Icons.code),
                        label: const Text("View Code"),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(50),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;

              if (constraints.maxWidth > 1100) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 700) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: HomeController.projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 260,
                ),
                itemBuilder: (context, index) {
                  final project = HomeController.projects[index];

                  return GlassCard(
                    index: index,
                    title: project.title,
                    subtitle: project.subtitle,
                    techStack: project.techStack,
                    result: project.result,
                    liveUrl: project.liveUrl,
                    githubUrl: project.githubUrl,
                    youtube: project.youtube,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _featuredProjectTablet() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                AppColors.themeColor.withValues(alpha: .15),
                AppColors.color141718.withValues(alpha: .45),
              ],
            ),
            border: Border.all(
              color: AppColors.themeColor.withValues(alpha: .25),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🚀 Featured Project",
                      style: dmSansW200.copyWith(color: AppColors.themeColor),
                    ),
                    const Gap(12),
                    Text(
                      HomeController.featuredProject.title,
                      style: dmSansW200.copyWith(
                        fontSize: 30,
                        color: AppColors.white,
                      ),
                    ),
                    const Gap(12),
                    Text(
                      HomeController.featuredProject.subtitle,
                      style: dmSansW200.copyWith(
                        color: AppColors.white.withValues(alpha: .9),
                        height: 1.6,
                      ),
                    ),
                    const Gap(18),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: HomeController.featuredProject.techStack.map((
                        tech,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor.withValues(alpha: .15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            tech,
                            style: dmSansW200.copyWith(
                              color: AppColors.themeColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.themeColor.withValues(alpha: .4),
                      AppColors.transparent,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        const Gap(30),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 1;

            if (constraints.maxWidth > 1100) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth > 700) {
              crossAxisCount = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeController.projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 260,
              ),
              itemBuilder: (context, index) {
                final project = HomeController.projects[index];

                return GlassCard(
                  index: index,
                  title: project.title,
                  subtitle: project.subtitle,
                  techStack: project.techStack,
                  result: project.result,
                  liveUrl: project.liveUrl,
                  githubUrl: project.githubUrl,
                  youtube: project.youtube,
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _featuredProjectMobile() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.color141718.withValues(alpha: .35),
            border: Border.all(
              color: AppColors.themeColor.withValues(alpha: .2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withValues(alpha: .15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "🚀 Featured Project",
                  style: dmSansW200.copyWith(
                    color: AppColors.themeColor,
                    fontSize: 12,
                  ),
                ),
              ),
              const Gap(16),
              Text(
                HomeController.featuredProject.title,
                style: dmSansW200.copyWith(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              const Gap(10),
              Text(
                HomeController.featuredProject.subtitle,
                style: dmSansW200.copyWith(
                  fontSize: 14,
                  color: AppColors.white.withValues(alpha: .9),
                  height: 1.6,
                ),
              ),
              const Gap(16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: HomeController.featuredProject.techStack.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withValues(alpha: .12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tech,
                      style: dmSansW200.copyWith(
                        color: AppColors.themeColor,
                        fontSize: 11,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Gap(18),
              Text(
                HomeController.featuredProject.result,
                style: dmSansW200.copyWith(
                  color: AppColors.white.withValues(alpha: .85),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Utility.launchExternalUrl(
                      HomeController.featuredProject.youtube!,
                    );
                  },
                  icon: const Icon(Icons.play_circle_fill),
                  label: const Text("Watch Demo"),
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: HomeController.projects.length,
          separatorBuilder: (_, __) => const Gap(20),
          itemBuilder: (_, index) {
            final project = HomeController.projects[index];

            return GlassCard(
              index: index,
              title: project.title,
              subtitle: project.subtitle,
              techStack: project.techStack,
              result: project.result,
              liveUrl: project.liveUrl,
              githubUrl: project.githubUrl,
              youtube: project.youtube,
            );
          },
        ),
      ],
    );
  }
}
