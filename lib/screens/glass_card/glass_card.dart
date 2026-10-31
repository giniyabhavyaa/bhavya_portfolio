import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GlassCard extends StatefulWidget {
  const GlassCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.index,
    this.liveUrl,
    this.githubUrl,
    this.youtube,
    this.techStack = const [],
    this.result = '',
  });

  final String title;
  final String subtitle;
  final String? liveUrl;
  final String? githubUrl;
  final String? youtube;
  final int index;
  final List<String> techStack;
  final String result;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;
  bool _pressed = false;

  Future<void> _open(String? url) async {
    if (url != null && url.isNotEmpty) {
      await Utility.launchExternalUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scale = _pressed ? 0.985 : (_hovered ? 1.02 : 1.0);
    final primaryUrl = widget.youtube ?? widget.liveUrl;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Listener(
        onPointerDown: (_) => setState(() => _pressed = true),
        onPointerUp: (_) => setState(() => _pressed = false),
        onPointerCancel: (_) => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.color131A2D.withValues(alpha: .9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _hovered
                    ? AppColors.themeColor.withValues(alpha: .65)
                    : AppColors.white.withValues(alpha: .08),
              ),
              boxShadow: [
                BoxShadow(
                  color: _hovered
                      ? AppColors.themeColor.withValues(alpha: .12)
                      : AppColors.black.withValues(alpha: .2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: dmSansW200.copyWith(
                    color: AppColors.white,
                    fontSize: 21,
                  ),
                ),
                const Gap(8),
                Text(
                  widget.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: dmSansW200.copyWith(
                    color: AppColors.white.withValues(alpha: .88),
                    height: 1.45,
                    fontSize: 14,
                  ),
                ),
                if (widget.techStack.isNotEmpty) ...[
                  const Gap(14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.techStack.map(_techChip).toList(),
                  ),
                ],
                if (widget.result.isNotEmpty) ...[
                  const Gap(14),
                  Text(
                    widget.result,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: dmSansW200.copyWith(
                      color: AppColors.white.withValues(alpha: .75),
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const Gap(16),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    if (primaryUrl != null)
                      ElevatedButton.icon(
                        onPressed: () => _open(primaryUrl),
                        icon: Icon(
                          widget.youtube != null
                              ? Icons.play_circle_fill
                              : Icons.open_in_new,
                        ),
                        label: Text(widget.youtube != null ? 'Demo' : 'Live'),
                      ),
                    if (widget.githubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () => _open(widget.githubUrl),
                        icon: const Icon(Icons.code),
                        label: const Text('Code'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _techChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tech,
        style: dmSansW200.copyWith(fontSize: 11, color: AppColors.themeColor),
      ),
    );
  }
}
