import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:bhavya_portfolio/utils/app_enums.dart';
import 'package:bhavya_portfolio/utils/extension.dart';

import '../../helpers/app_colors.dart';

class GlassCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String? liveUrl;
  final String? githubUrl;
  final String? youtube;
  final int index;
  final List<String> techStack;
  final String result;

  const GlassCard({
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

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    switch (context.deviceType) {
      case DeviceType.mobile:
        return mobileCard();
      case DeviceType.tablet:
        return tabletCard();
      case DeviceType.desktop:
        return desktopCard();
    }
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: AppColors.color141718.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.colorF2F3F6.withValues(alpha: 0.12)),
    );
  }

  Widget mobileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff131A2D).withValues(alpha: .92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .2), blurRadius: 18),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: dmSansW700.copyWith(color: Colors.white, fontSize: 24),
          ),
          const Gap(12),
          Text(
            widget.subtitle,
            style: dmSansW400.copyWith(
              color: Colors.white.withValues(alpha: .9),
              height: 1.5,
              fontSize: 14,
            ),
          ),
          const Gap(16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.techStack.map(_techChip).toList(),
          ),
          const Gap(16),
          Text(
            widget.result,
            style: dmSansW400.copyWith(
              color: Colors.white.withValues(alpha: .85),
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => Utility.launchExternalUrl(
                    widget.youtube ?? widget.liveUrl ?? '',
                  ),
                  icon: const Icon(Icons.play_arrow),
                  label: Text(widget.youtube != null ? "Demo" : "Live"),
                ),
              ),
              if (widget.githubUrl != null) ...[
                const Gap(10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () =>
                        Utility.launchExternalUrl(widget.githubUrl!),
                    icon: const Icon(Icons.code),
                    label: const Text("Code"),
                  ),
                ),
              ],
            ],
          ),
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
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: dmSansW700.copyWith(fontSize: 20, color: Colors.white),
          ),
          const Gap(10),
          Expanded(
            child: Text(
              widget.subtitle,
              style: dmSansW700.copyWith(fontSize: 13, color: Colors.white),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: widget.techStack.map(_techChip).toList(),
          ),
          const Gap(12),
          Text(
            widget.result,
            style: dmSansW700.copyWith(fontSize: 13, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(14),
          Row(
            children: [
              Expanded(child: _primaryButton()),
              const Gap(8),
              if (widget.githubUrl != null) Expanded(child: _githubButton()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _githubButton() {
    return OutlinedButton.icon(
      onPressed: widget.githubUrl == null
          ? null
          : () => Utility.launchExternalUrl(widget.githubUrl!),
      icon: const Icon(Icons.code),
      label: const Text("Code"),
    );
  }

  Widget _primaryButton() {
    final url = widget.youtube ?? widget.liveUrl;

    return ElevatedButton.icon(
      onPressed: url == null ? null : () => Utility.launchExternalUrl(url),
      icon: const Icon(Icons.play_circle_fill),
      label: Text(widget.youtube != null ? "Watch Demo" : "View Live"),
    );
  }

  Widget desktopCard() {
    final hover = _isHover;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(22),
        transform: hover
            ? (Matrix4.translationValues(0, -8, 0) *
                  Matrix4.diagonal3Values(1.02, 1.02, 1.0))
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
              widget.title,
              style: dmSansW700.copyWith(color: Colors.white, fontSize: 22),
            ),
            const Gap(12),
            Text(
              widget.subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: dmSansW400.copyWith(
                color: Colors.white.withValues(alpha: .9),
                height: 1.6,
                fontSize: 14,
              ),
            ),
            const Gap(18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.techStack.map(_techChip).toList(),
            ),
            const Spacer(),
            Text(
              widget.result,
              style: dmSansW400.copyWith(
                color: Colors.white.withValues(alpha: .85),
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Gap(18),
            Row(
              children: [
                Expanded(child: _primaryButton()),
                if (widget.githubUrl != null) ...[
                  const Gap(10),
                  Expanded(child: _githubButton()),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _techChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tech,
        style: dmSansW500.copyWith(fontSize: 11, color: AppColors.themeColor),
      ),
    );
  }
}
