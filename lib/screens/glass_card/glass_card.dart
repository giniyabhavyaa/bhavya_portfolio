import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/AppColors.dart';

Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class GlassCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? liveUrl;
  final String? githubUrl;
  final String? youtube;
  final int index;
  late final List<String> techStack;
  final String result;

  GlassCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.index,
    this.liveUrl,
    this.githubUrl,
    this.youtube,
    this.techStack = const [],
    this.result = "",
  });

  final RxBool _isHover = false.obs;
  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      return mobileCard();
    }
    if (context.isTablet) {
      return tabletCard();
    }
    return desktopCard();
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: AppColors.color141718.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.colorF2F3F6.withValues(alpha: 0.12),
      ),
    );
  }

  Widget mobileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff131A2D).withValues(alpha: .92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: .08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            title,
            style: dmSansW700.copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
          ),

          const Gap(12),

          Text(
            subtitle,
            style: dmSansW400.copyWith(
              color: Colors.white70,
              height: 1.5,
              fontSize: 14,
            ),
          ),

          const Gap(16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techStack.map(_techChip).toList(),
          ),

          const Gap(16),

          Text(
            result,
            style: dmSansW400.copyWith(
              color: Colors.white60,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),

          const Gap(20),

          Row(
            children: [

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _launchUrl(youtube ?? liveUrl ?? ''),
                  icon: const Icon(Icons.play_arrow),
                  label: Text(
                    youtube != null
                        ? "Demo"
                        : "Live",
                  ),
                ),
              ),

              if (githubUrl != null) ...[
                const Gap(10),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        _launchUrl(githubUrl!),
                    icon: const Icon(Icons.code),
                    label: const Text("Code"),
                  ),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }

  Widget tabletCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: dmSansW700.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
          ),

          const Gap(10),

          Expanded(
            child: Text(
              subtitle,
              style: dmSansW700.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: techStack.map(_techChip).toList(),
          ),

          const Gap(12),

          Text(
            result,
            style: dmSansW700.copyWith(
              fontSize: 13,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const Gap(14),

          Row(
            children: [
              Expanded(child: _primaryButton()),
              const Gap(8),
              if (githubUrl != null)
                Expanded(child: _githubButton()),
            ],
          )
        ],
      ),
    );
  }
  Widget _githubButton() {
    return OutlinedButton.icon(
      onPressed: githubUrl == null
          ? null
          : () => _launchUrl(githubUrl!),
      icon: const Icon(Icons.code),
      label: const Text("Code"),
    );
  }
  Widget _primaryButton() {
    final url = youtube ?? liveUrl;

    return ElevatedButton.icon(
      onPressed: url == null
          ? null
          : () => _launchUrl(url),
      icon: const Icon(Icons.play_circle_fill),
      label: Text(
        youtube != null ? "Watch Demo" : "View Live",
      ),
    );
  }

  Widget desktopCard() {
    return Obx(() {
      final hover = _isHover.value;

      return MouseRegion(
        onEnter: (_) => _isHover.value = true,
        onExit: (_) => _isHover.value = false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(22),
          transform: hover
              ? (Matrix4.identity()
            ..translate(0, -8)
            ..scale(1.02))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xff131A2D).withValues(alpha: .85),
            border: Border.all(
              color: hover
                  ? AppColors.themeColor
                  : Colors.white.withValues(alpha: .08),
            ),
            boxShadow: [
              BoxShadow(
                color: hover
                    ? AppColors.themeColor.withValues(alpha: .18)
                    : Colors.black.withValues(alpha: .15),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: dmSansW700.copyWith(
                  color: Colors.green,
                  fontSize: 22,
                ),
              ),

              const Gap(12),

              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: dmSansW400.copyWith(
                  color: Colors.green,
                  height: 1.6,
                  fontSize: 14,
                ),
              ),

              const Gap(18),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: techStack.map(_techChip).toList(),
              ),

              const Spacer(),

              Text(
                result,
                style: dmSansW400.copyWith(
                  color: Colors.green,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const Gap(18),

              Row(
                children: [

                  Expanded(
                    child: _primaryButton(),
                  ),

                  if (githubUrl != null) ...[
                    const Gap(10),

                    Expanded(
                      child: _githubButton(),
                    ),
                  ],
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _techChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tech,
        style: dmSansW500.copyWith(
          fontSize: 11,
          color: AppColors.themeColor,
        ),
      ),
    );
  }
}


