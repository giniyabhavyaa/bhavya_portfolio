import 'package:bhavya_portfolio/model/feature_model.dart';
import 'package:bhavya_portfolio/model/project_model.dart';
import 'package:bhavya_portfolio/screens/home/data/home_data.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final sectionKeys = List.generate(
    HomeData.navigationItems.length,
    (_) => GlobalKey(),
  );
  final tilt = ValueNotifier<Offset>(Offset.zero);

  String get fullText => HomeData.introText;

  static ProjectModel get featuredProject => HomeData.featuredProject;
  static List<ProjectModel> get projects => HomeData.projects;
  static List<FeatureModel> get features => HomeData.features;

  void scrollToSection(int index) {
    if (index < 0 || index >= sectionKeys.length) return;
    final targetContext = sectionKeys[index].currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void updateTilt(Offset position) {
    tilt.value = Offset(-(position.dy - 150) / 600, (position.dx - 150) / 600);
  }

  void resetTilt([_]) => tilt.value = Offset.zero;

  String getNormalText(String text) =>
      text.split(HomeData.introHighlight).first;

  String getHighlightText(String text) =>
      text.contains(HomeData.introHighlight) ? HomeData.introHighlight : '';

  String getRemainingText(String text) => text.contains(HomeData.introHighlight)
      ? text.split(HomeData.introHighlight).last
      : '';

  Future<void> openGithub() async {
    await Utility.launchExternalUrl(Utility.githubUrl);
  }

  Future<void> openEmail() async {
    await Utility.launchEmail();
  }

  Future<void> openResume() async {
    await Utility.launchExternalUrl(Utility.resumeUrl);
  }

  Future<void> openLinkedin() async {
    await Utility.launchExternalUrl(Utility.linkedInUrl);
  }

  @override
  void onClose() {
    scrollController.dispose();
    tilt.dispose();
    super.onClose();
  }
}
