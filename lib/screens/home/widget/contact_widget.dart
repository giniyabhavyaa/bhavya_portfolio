import 'package:bhavya_portfolio/helpers/app_colors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(width < 600 ? 20 : 45),
      margin: EdgeInsets.symmetric(
        horizontal: width >= 1100
            ? 345
            : width >= 600
            ? 80
            : 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2F), Color(0xFF252544)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.themeColor.withValues(alpha: 0.35),
            blurRadius: 45,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Let's Work Together",
            style: dmSansW700.copyWith(color: Colors.white, fontSize: 30),
          ),
          const Gap(10),
          Text(
            "Available for freelance & full-time roles.",
            textAlign: TextAlign.center,
            style: dmSansW400.copyWith(color: Colors.white70, fontSize: 16),
          ),
          const Gap(35),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Column(
              children: [
                Text(
                  "Let’s build your next app 🚀",
                  textAlign: TextAlign.center,
                  style: dmSansW700.copyWith(color: Colors.white, fontSize: 26),
                ),

                const Gap(14),

                Text(
                  "Need a modern Flutter app or a scalable backend solution? Let’s connect and turn your idea into reality.",
                  textAlign: TextAlign.center,
                  style: dmSansW400.copyWith(
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const Gap(28),
                ElevatedButton(
                  onPressed: () =>
                      launchUrl(Uri.parse("mailto:giniyabhavyaa@gmail.com")),
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: AppColors.themeColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.send_rounded, color: Colors.white),
                      Gap(10),
                      Text(
                        "Contact Me",
                        style: dmSansW600.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
