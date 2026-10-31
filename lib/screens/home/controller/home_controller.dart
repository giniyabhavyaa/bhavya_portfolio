import 'package:bhavya_portfolio/model/project_model.dart';
import 'package:bhavya_portfolio/screens/home/data/home_data.dart';
import 'package:bhavya_portfolio/model/feature_model.dart';
import 'package:bhavya_portfolio/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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

  double tiltX = 0.0;
  double tiltY = 0.0;


  final String fullText =
      "I build fast, scalable mobile apps using Flutter, Firebase, and clean architecture.";


  final List<String> skills = [
    "Flutter – Advanced",
    "Dart – Advanced",
    "GetX – Advanced",
    "Firebase – Intermediate",
    "Git – Intermediate",
    "REST API – Advanced",
    "BLoC – Advanced",
  ];
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
    tiltY = (position.dx - 150) / 600;
    tiltX = -(position.dy - 150) / 600;
    update(['heroTilt']);
  }

  void resetTilt(value) {
    tiltX = 0;
    tiltY = 0;
    update(['heroTilt']);
  }


  final featuredProject = ProjectModel(
    title: "Play Pitch",
    subtitle:
    "A smart box cricket & ground booking app where users can find nearby grounds, check live slot availability, and book matches instantly.",
    techStack: [
      "Flutter",
      "Firebase",
      "BLoC",
      "Google Maps",
      "REST API",
    ],
    result:
    "Built a scalable real-time booking system with smooth UI, slot management, and secure authentication.",
    youtube: "YOUR_YOUTUBE_LINK",
    githubUrl: "YOUR_GITHUB_LINK",
  );


  final List<ProjectModel> projects = [
    ProjectModel(
      title: "Finance Manager",
      subtitle: "Manage daily expenses easily",
      techStack: ["Flutter", "GetX", "REST API"],
      result: "Optimized UI for smooth performance",
    ),

    ProjectModel(
      title: "My Resume",
      subtitle: "Flutter Web portfolio",
      liveUrl: "https://giniyabhavyaa.github.io/bhavya-resume/",
      githubUrl: "https://github.com/giniyabhavyaa/bhavya-resume",
      techStack: ["Flutter Web", "Responsive UI"],
      result: "Fast loading and responsive design",
    ),

    ProjectModel(
      title: "Shopping App",
      subtitle: "API based shopping app",
      youtube: "https://www.youtube.com/watch?v=WN-BKOdYuWw",
      githubUrl: "https://github.com/giniyabhavyaa/bhavya-resume",
      techStack: ["Flutter", "REST API", "GetX"],
      result: "Smooth product browsing experience",
    ),
  ];
  Future<void> openGithub() async {
    final Uri url = Uri.parse(
      'https://github.com/giniyabhavyaa',
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch GitHub';
    }
  }

  void openEmail() {
    launchUrl(Uri.parse("mailto:giniyabhavyaa@gmail.com"));
  }

  void openResume() {
    launchUrl(Uri.parse("https://giniyabhavyaa.github.io/bhavya-resume/"));
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
    super.dispose();
  }
}
