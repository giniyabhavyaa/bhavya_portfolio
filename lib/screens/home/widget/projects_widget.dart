import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/glass_card/glass_card.dart';
import 'package:bhavya_portfolio/screens/home/data/home_data.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width >= 1100 ? 3 : (width >= 700 ? 2 : 1);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Projects',
                      style: dmSansW200.copyWith(
                        fontSize: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const Gap(28),
                  _FeaturedProjectCard(),
                  const Gap(32),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: HomeData.projects.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      mainAxisExtent: 260,
                    ),
                    itemBuilder: (context, index) {
                      final project = HomeData.projects[index];
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
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FeaturedProjectCard extends StatelessWidget {
  const _FeaturedProjectCard();

  @override
  Widget build(BuildContext context) {
    final project = HomeData.featuredProject;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            AppColors.themeColor.withValues(alpha: .16),
            AppColors.color141718.withValues(alpha: .42),
          ],
        ),
        border: Border.all(color: AppColors.themeColor.withValues(alpha: .28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withValues(alpha: .14),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '🚀 Featured Project',
              style: dmSansW200.copyWith(
                color: AppColors.themeColor,
                fontSize: 13,
              ),
            ),
          ),
          const Gap(14),
          Text(
            project.title,
            style: dmSansW200.copyWith(color: AppColors.white, fontSize: 26),
          ),
          const Gap(8),
          Text(
            project.subtitle,
            style: dmSansW200.copyWith(
              color: AppColors.white.withValues(alpha: .9),
              height: 1.5,
              fontSize: 15,
            ),
          ),
          const Gap(14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.techStack.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withValues(alpha: .14),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  tech,
                  style: dmSansW200.copyWith(
                    color: AppColors.themeColor,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
          const Gap(14),
          Text(
            project.result,
            style: dmSansW200.copyWith(
              color: AppColors.white.withValues(alpha: .82),
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Gap(18),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              if (project.youtube != null)
                ElevatedButton.icon(
                  onPressed: () => Utility.launchExternalUrl(project.youtube!),
                  icon: const Icon(Icons.play_circle_fill),
                  label: const Text('Watch Demo'),
                ),
              if (project.githubUrl != null)
                OutlinedButton.icon(
                  onPressed: () =>
                      Utility.launchExternalUrl(project.githubUrl!),
                  icon: const Icon(Icons.code),
                  label: const Text('View Code'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
