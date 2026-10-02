import 'package:bhavya_portfolio/model/feature_model.dart';
import 'package:bhavya_portfolio/model/project_model.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:bhavya_portfolio/view/screens/home/data/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  final sectionKeys = List.generate(
    HomeData.navigationItems.length,
    (_) => GlobalKey(),
  );

  /// Keeps pointer-driven hero updates scoped to the hero image only.
  final tilt = ValueNotifier<Offset>(Offset.zero);
  late final AnimationController floatController;

  @override
  void onInit() {
    super.onInit();
    floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  void scrollToSection(int index) {
    if (index < 0 || index >= sectionKeys.length) return;
    final context = sectionKeys[index].currentContext;
    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void updateTilt(Offset position) {
    tilt.value = Offset(-(position.dy - 150) / 600, (position.dx - 150) / 600);
  }

  void resetTilt([_]) => tilt.value = Offset.zero;

  String get fullText => HomeData.introText;

  String getNormalText(String text) =>
      text.split(HomeData.introHighlight).first;

  String getHighlightText(String text) =>
      text.contains(HomeData.introHighlight) ? HomeData.introHighlight : '';

  String getRemainingText(String text) => text.contains(HomeData.introHighlight)
      ? text.split(HomeData.introHighlight).last
      : '';

  // Compatibility accessors keep presentation widgets independent of storage.
  static ProjectModel get featuredProject => HomeData.featuredProject;
  static List<ProjectModel> get projects => HomeData.projects;
  static List<FeatureModel> get features => HomeData.features;

  Future<void> openGithub() => Utility.launchExternalUrl(Utility.githubUrl);
  Future<void> openEmail() => Utility.launchEmail();
  Future<void> openResume() => Utility.launchExternalUrl(Utility.resumeUrl);
  Future<void> openLinkedin() => Utility.launchExternalUrl(Utility.linkedInUrl);

  @override
  void onClose() {
    scrollController.dispose();
    floatController.dispose();
    tilt.dispose();
    super.onClose();
  }
}
