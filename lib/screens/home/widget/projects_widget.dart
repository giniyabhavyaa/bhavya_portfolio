import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/glass_card/glass_card.dart';
import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchProjectUrl(String url) async {
  final uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (context.isDesktop) {
          return _featuredProjectDesktop(controller);
        }

        if (ContextExtensionss(context).isTablet) {
          return _featuredProjectTablet(controller);
        }

        return _featuredProjectMobile(controller);
      },
    );
  }


  Widget _featuredProjectDesktop(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Center(
            child: Text(
              "Projects",
              style: dmSansW700.copyWith(
                fontSize: 28,
                color: AppColors.white,
              ),
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
                    const Text(
                      "🚀",
                      style: TextStyle(fontSize: 28),
                    ),
                    const Gap(10),

                    Text(
                      "Featured Project",
                      style: dmSansW700.copyWith(
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),

                const Gap(20),

                Text(
                  controller.featuredProject.title,
                  style: dmSansW700.copyWith(
                    fontSize: 32,
                    color: AppColors.themeColor,
                  ),
                ),

                const Gap(12),

                Text(
                  controller.featuredProject.subtitle,
                  style: dmSansW400.copyWith(
                    fontSize: 16,
                    color: AppColors.colorF6F6F6.withValues(alpha: .85),
                    height: 1.6,
                  ),
                ),

                const Gap(18),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: controller.featuredProject.techStack.map((tech) {
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
                        style: dmSansW500.copyWith(
                          color: AppColors.themeColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Gap(20),

                Text(
                  controller.featuredProject.result,
                  style: dmSansW400.copyWith(
                    fontSize: 15,
                    color: AppColors.white.withValues(alpha: .75),
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const Gap(24),

                Row(
                  children: [

                    if (controller.featuredProject.youtube != null)
                      ElevatedButton.icon(
                        onPressed: () =>
                            launchProjectUrl(
                                controller.featuredProject.youtube!),
                        icon: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                        ),
                        label: const Text("Watch Demo"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 16,
                          ),
                        ),
                      ),

                    const Gap(14),

                    if (controller.featuredProject.githubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () =>
                            launchProjectUrl(
                                controller.featuredProject.githubUrl!),
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
                itemCount: controller.projects.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final project = controller.projects[index];

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
          )
        ],
      ),
    );
  }

  Widget _featuredProjectTablet(HomeController controller) {
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
                      style: dmSansW600.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),

                    const Gap(12),

                    Text(
                      controller.featuredProject.title,
                      style: dmSansW700.copyWith(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),

                    const Gap(12),

                    Text(
                      controller.featuredProject.subtitle,
                      style: dmSansW400.copyWith(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),

                    const Gap(18),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.featuredProject.techStack.map((tech) {
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
                            style: dmSansW500.copyWith(
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
                      Colors.transparent,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Gap(30),
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
              itemCount: controller.projects.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                final project = controller.projects[index];

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
        )

      ],
    );
  }

  Widget _featuredProjectMobile(HomeController controller) {
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
                  style: dmSansW500.copyWith(
                    color: AppColors.themeColor,
                    fontSize: 12,
                  ),
                ),
              ),

              const Gap(16),

              Text(
                controller.featuredProject.title,
                style: dmSansW700.copyWith(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),

              const Gap(10),

              Text(
                controller.featuredProject.subtitle,
                style: dmSansW400.copyWith(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),

              const Gap(16),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.featuredProject.techStack.map((tech) {
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
                      style: dmSansW500.copyWith(
                        color: AppColors.themeColor,
                        fontSize: 11,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Gap(18),

              Text(
                controller.featuredProject.result,
                style: dmSansW400.copyWith(
                  color: Colors.white60,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const Gap(20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    launchProjectUrl(
                      controller.featuredProject.youtube!,
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
          itemCount: controller.projects.length,
          separatorBuilder: (_, __) => const Gap(20),
          itemBuilder: (_, index) {
            final project = controller.projects[index];

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
        )
      ],
    );
  }

}