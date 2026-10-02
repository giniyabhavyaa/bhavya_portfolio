import 'package:bhavya_portfolio/model/moon_data.dart';
import 'package:bhavya_portfolio/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final scrollController = ScrollController();

  final sectionKeys = List.generate(7, (index) => GlobalKey());

  static const List<String> item = [
    "Home",
    "About",
    "Services",
    "Projects",
    "Skills",
    "Why Me",
    "Contact",
  ];

  /// Keeps pointer-driven hero updates scoped to the hero image only.
  final tilt = ValueNotifier<Offset>(Offset.zero);

  late AnimationController floatController;

  @override
  void onInit() {
    super.onInit();

    floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  static const moons = [
    MoonData(size: 90, speed: 0.08, index: 0),
    MoonData(size: 70, speed: 0.12, index: 1),
    MoonData(size: 110, speed: 0.06, index: 2),
    MoonData(size: 65, speed: 0.15, index: 3),
    MoonData(size: 55, speed: 0.18, index: 4),
  ];
  final String fullText =
      "I build fast, scalable mobile apps using Flutter, Firebase, and clean architecture.";

  static const List<String> skills = [
    "Flutter – Advanced",
    "Dart – Advanced",
    "Responsive UI – Advanced",
    "Material Design – Advanced",
    "GetX – Advanced",
    "BLoC / Cubit – Advanced",
    "Provider – Proficient",
    "Riverpod – Proficient",
    "Clean Architecture – Advanced",
    "SOLID Principles – Advanced",
    "Firebase – Advanced",
    "Firebase Authentication – Advanced",
    "Cloud Firestore – Advanced",
    "Firebase Cloud Messaging – Proficient",
    "REST APIs – Advanced",
    "JSON Serialization – Advanced",
    "Dio / HTTP – Advanced",
    "Local Storage – Proficient",
    "SQLite / Hive – Proficient",
    "Git & GitHub – Advanced",
    "Unit & Widget Testing – Proficient",
    "Flutter DevTools – Proficient",
    "Performance Optimization – Advanced",
    "Push Notifications – Proficient",
    "Google Maps Integration – Proficient",
    "CI/CD – Proficient",
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
    tilt.value = Offset(-(position.dy - 150) / 600, (position.dx - 150) / 600);
  }

  void resetTilt([_]) {
    tilt.value = Offset.zero;
  }

  static const featuredProject = ProjectModel(
    title: "Play Pitch",
    subtitle:
        "A smart box cricket & ground booking app where users can find nearby grounds, check live slot availability, and book matches instantly.",
    techStack: ["Flutter", "Firebase", "BLoC", "Google Maps", "REST API"],
    result:
        "Built a scalable real-time booking system with smooth UI, slot management, and secure authentication.",
    youtube: "YOUR_YOUTUBE_LINK",
    githubUrl: "YOUR_GITHUB_LINK",
  );

  static const List<ProjectModel> projects = [
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
    final Uri url = Uri.parse('https://github.com/giniyabhavyaa');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch GitHub';
    }
  }

  void openEmail() {
    launchUrl(Uri.parse("mailto:giniyabhavyaa@gmail.com"));
  }

  void openResume() {
    launchUrl(Uri.parse("https://giniyabhavyaa.github.io/bhavya-resume/"));
  }

  void openLinkedin() {
    launchUrl(
      Uri.parse("https://www.linkedin.com/in/bhavyaa-bhavya-giniya-826b9b39a/"),
    );
  }

  String getNormalText(String text) {
    if (!text.contains("fast, scalable mobile apps")) return text;
    return text.split("fast, scalable mobile apps")[0];
  }

  String getHighlightText(String text) {
    if (!text.contains("fast, scalable mobile apps")) return "";
    return "fast, scalable mobile apps";
  }

  String getRemainingText(String text) {
    if (!text.contains("fast, scalable mobile apps")) return "";
    return text.split("fast, scalable mobile apps").last;
  }

  static const List<Map<String, dynamic>> features = [
    {
      "title": "Clean & Maintainable Code",
      "subtitle":
          "I write structured and reusable Flutter code following clean architecture principles. "
          "My focus is on readability, scalability, and long-term maintainability so future updates "
          "and feature additions become easier and faster for any growing application.",
      "icon": Icons.code_rounded,
    },
    {
      "title": "Fast Delivery",
      "subtitle":
          "I prioritize efficient development workflows and rapid implementation without compromising quality. "
          "From UI development to API integration, I ensure smooth execution and timely delivery "
          "with consistent performance optimization throughout the project lifecycle.",
      "icon": Icons.flash_on_rounded,
    },
    {
      "title": "Responsive Communication",
      "subtitle":
          "Clear communication is an important part of every successful project. "
          "I provide regular progress updates, quick responses, and transparent collaboration "
          "to ensure clients always stay informed during development.",
      "icon": Icons.chat_rounded,
    },
    {
      "title": "Scalable App Architecture",
      "subtitle":
          "I build applications with scalability and performance in mind from the beginning. "
          "Using proper state management, modular structure, and optimized architecture, "
          "the app remains stable, maintainable, and ready for future business growth.",
      "icon": Icons.architecture_rounded,
    },
  ];

  @override
  void onClose() {
    scrollController.dispose();
    floatController.dispose();
    tilt.dispose();
    super.onClose();
  }
}
