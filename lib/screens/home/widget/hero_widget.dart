import 'package:bhavya_portfolio/base/hire_me_button.dart';
import 'package:bhavya_portfolio/gen/assets.gen.dart';
import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/screens/home/controller/home_controller.dart';
import 'package:bhavya_portfolio/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  HomeController get controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: context.isDesktopScreen
            ? 140
            : context.isTabletScreen
            ? 100
            : 70,
        horizontal: context.isDesktopScreen
            ? 80
            : context.isTabletScreen
            ? 48
            : 20,
      ),
      child: context.isDesktopScreen
          ? _desktopHero()
          : context.isTabletScreen
          ? _laptopHero(context)
          : _mobileHero(),
    );
  }

  Widget _laptopHero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.themeColor.withValues(alpha: 0.45),
                        AppColors.themeColor.withValues(alpha: 0.15),
                        AppColors.transparent,
                      ],
                      stops: const [0.4, 0.7, 1],
                    ),
                  ),
                ),
                Container(
                  width: 220,
                  height: 220,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.themeColor.withValues(alpha: 0.6),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      Assets.png.icImage.path,
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(duration: const Duration(milliseconds: 600))
            .scale(duration: const Duration(milliseconds: 700))
            .moveY(begin: 8, end: -8, duration: const Duration(seconds: 4))
            .then()
            .moveY(begin: -8, end: 8, duration: const Duration(seconds: 4)),

        const Gap(28),

        Text(
              "Flutter Developer Who Builds Scalable Apps 🚀",
              style: dmSansW200.copyWith(
                fontSize: 36,
                color: AppColors.white,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            )
            .animate()
            .fadeIn(duration: const Duration(milliseconds: 500))
            .slideY(begin: 0.2),

        const Gap(14),

        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: controller.fullText.length),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            final currentText = controller.fullText.substring(
              0,
              value.clamp(0, controller.fullText.length),
            );
            return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: dmSansW200.copyWith(
                  fontSize: 16,
                  color: AppColors.white.withValues(alpha: 0.9),
                ),
                children: [
                  TextSpan(text: controller.getNormalText(currentText)),
                  TextSpan(
                    text: controller.getHighlightText(currentText),
                    style: dmSansW200.copyWith(color: AppColors.themeColor),
                  ),
                  TextSpan(text: controller.getRemainingText(currentText)),
                ],
              ),
            );
          },
        ),

        const Gap(14),

        Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.themeColor.withValues(alpha: 0.1),
                border: Border.all(
                  color: AppColors.themeColor.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                "Available for freelance projects | Fast delivery | Clean code",
                style: dmSansW200.copyWith(
                  fontSize: 13,
                  color: AppColors.themeColor.withValues(alpha: 0.80),
                ),
                textAlign: TextAlign.center,
              ),
            )
            .animate(delay: const Duration(milliseconds: 400))
            .fadeIn(duration: const Duration(milliseconds: 500))
            .moveY(begin: 10, end: 0),

        const Gap(24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ActionIcon(
              icon: FontAwesomeIcons.github.data,
              tooltip: "GitHub",
              onTap: controller.openGithub,
            ),
            const Gap(16),
            _ActionIcon(
              icon: Icons.email,
              tooltip: "Email",
              onTap: controller.openEmail,
            ),
            const Gap(16),
            _ActionIcon(
              icon: Icons.description_rounded,
              tooltip: "Resume",
              onTap: controller.openResume,
            ),
            const Gap(16),
            _ActionIcon(
              icon: FontAwesomeIcons.linkedin.data,
              tooltip: "LinkedIn",
              onTap: controller.openLinkedin,
            ),
          ],
        ),

        const Gap(28),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HireMeButton(),
            const Gap(16),
            OutlinedButton(
              onPressed: () => controller.scrollToSection(3),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.themeColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
              ),
              child: Text(
                "View Projects",
                style: dmSansW200.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _desktopHero() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.black.withValues(alpha: 0.35),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.08),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                      "Flutter Developer Who Builds Scalable Apps 🚀",
                      style: dmSansW200.copyWith(
                        fontSize: 46,
                        color: AppColors.white,
                        height: 1.1,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 500))
                    .slideX(begin: -0.2),

                const Gap(14),

                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: controller.fullText.length),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    final currentText = controller.fullText.substring(
                      0,
                      value.clamp(0, controller.fullText.length),
                    );
                    return RichText(
                      text: TextSpan(
                        style: dmSansW200.copyWith(
                          fontSize: 18,
                          color: AppColors.white.withValues(alpha: 0.9),
                        ),
                        children: [
                          TextSpan(text: controller.getNormalText(currentText)),
                          TextSpan(
                            text: controller.getHighlightText(currentText),
                            style: dmSansW200.copyWith(
                              color: AppColors.themeColor,
                            ),
                          ),
                          TextSpan(
                            text: controller.getRemainingText(currentText),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const Gap(16),

                Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.themeColor.withValues(alpha: 0.1),
                        border: Border.all(
                          color: AppColors.themeColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        "Available for freelance projects | Fast delivery | Clean code",
                        style: dmSansW200.copyWith(
                          fontSize: 13,
                          color: AppColors.themeColor.withValues(alpha: .80),
                        ),
                      ),
                    )
                    .animate(delay: const Duration(milliseconds: 400))
                    .fadeIn(duration: const Duration(milliseconds: 500))
                    .moveY(begin: 10, end: 0),

                const Gap(24),

                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _ActionIcon(
                      icon: FontAwesomeIcons.github.data,
                      tooltip: "GitHub",
                      onTap: controller.openGithub,
                    ),
                    const Gap(16),
                    _ActionIcon(
                      icon: Icons.email,
                      tooltip: "Email",
                      onTap: controller.openEmail,
                    ),
                    const Gap(16),
                    _ActionIcon(
                      icon: Icons.description_rounded,
                      tooltip: "Resume",
                      onTap: controller.openResume,
                    ),
                    const Gap(16),
                    _ActionIcon(
                      icon: FontAwesomeIcons.linkedin.data,
                      tooltip: "LinkedIn",
                      onTap: controller.openLinkedin,
                    ),
                  ],
                ),

                const Gap(28),

                Row(
                  children: [
                    HireMeButton(),
                    const Gap(16),
                    OutlinedButton(
                      onPressed: () => controller.scrollToSection(3),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.themeColor),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        "View Projects",
                        style: dmSansW200.copyWith(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const Gap(60),

        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            return MouseRegion(
              onHover: (event) {
                controller.updateTilt(
                  Offset(
                    event.localPosition.dx / width * 300,
                    event.localPosition.dy / height * 300,
                  ),
                );
              },
              onExit: controller.resetTilt,
              child: ValueListenableBuilder<Offset>(
                valueListenable: controller.tilt,
                builder: (_, tilt, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.identity()
                      ..rotateX(tilt.dx)
                      ..rotateY(tilt.dy),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 280,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        AppColors.themeColor.withValues(
                                          alpha: 0.45,
                                        ),
                                        AppColors.themeColor.withValues(
                                          alpha: 0.15,
                                        ),
                                        AppColors.transparent,
                                      ],
                                      stops: const [0.4, 0.7, 1],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  height: 400,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.themeColor.withValues(
                                          alpha: 0.6,
                                        ),
                                        AppColors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(22),
                                    child: Image.asset(
                                      Assets.png.icImage.path,
                                      filterQuality: FilterQuality.low,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(duration: const Duration(milliseconds: 600))
                            .scale(duration: const Duration(milliseconds: 700))
                            .moveY(
                              begin: 8,
                              end: -8,
                              duration: const Duration(seconds: 4),
                            )
                            .then()
                            .moveY(
                              begin: -8,
                              end: 8,
                              duration: const Duration(seconds: 4),
                            ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _mobileHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.themeColor.withValues(alpha: 0.4),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: AppColors.white,
                  child: ClipOval(
                    child: Image.asset(
                      Assets.png.icImage.path,
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(duration: const Duration(milliseconds: 600))
            .scale(duration: const Duration(milliseconds: 700))
            .moveY(begin: 8, end: -8, duration: const Duration(seconds: 4))
            .then()
            .moveY(begin: -8, end: 8, duration: const Duration(seconds: 4)),

        const Gap(20),

        Text(
          "Hi, I'm Bhavya 👋",
          style: dmSansW200.copyWith(fontSize: 32, color: AppColors.white),
        ).animate().fadeIn(),

        Text(
          "Building beautiful & performant apps with Flutter.",
          style: dmSansW200.copyWith(
            fontSize: 14,
            color: AppColors.color797979,
          ),
          textAlign: TextAlign.center,
        ).animate().fadeIn(),

        const Gap(10),

        Text(
          "Flutter Developer • GetX • Firebase • API",
          style: dmSansW200.copyWith(
            fontSize: 16,
            color: AppColors.color797979,
          ),
        ).animate().fadeIn(),

        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ActionIcon(
              icon: FontAwesomeIcons.github.data,
              tooltip: "GitHub",
              onTap: controller.openGithub,
            ),
            const Gap(16),
            _ActionIcon(
              icon: Icons.email,
              tooltip: "Email",
              onTap: controller.openEmail,
            ),
            const Gap(16),
            _ActionIcon(
              icon: Icons.description_rounded,
              tooltip: "Resume",
              onTap: controller.openResume,
            ),
            const Gap(16),
            _ActionIcon(
              icon: FontAwesomeIcons.linkedin.data,
              tooltip: "LinkedIn",
              onTap: controller.openLinkedin,
            ),
          ],
        ),
        const Gap(30),
        HireMeButton(),
      ],
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.white.withValues(alpha: 0.05),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.white.withValues(alpha: 0.9),
            ),
          ),
        ),
      ),
    );
  }
}
