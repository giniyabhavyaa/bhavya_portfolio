import 'package:bhavya_portfolio/helpers/AppColors.dart';
import 'package:bhavya_portfolio/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HireMeButton extends StatelessWidget {
  const HireMeButton({super.key});

  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'giniyabhavyaa@gmail.com',
      queryParameters: {
        'subject': 'Hiring Request',
        'body': 'Hello BhavyaGiniya,',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $emailUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchEmail,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding:  EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child:  Text(
        "Hire Me",
        style:dmSansW500.copyWith(fontSize: 18, color: AppColors.white),
      ),
    ).animate().fadeIn(duration: 600.ms).moveY(begin: 20, duration: 600.ms);
  }
}
