import 'package:bhavya_portfolio/model/feature_model.dart';
import 'package:bhavya_portfolio/model/moon_data.dart';
import 'package:bhavya_portfolio/model/navigation_item.dart';
import 'package:bhavya_portfolio/model/project_model.dart';
import 'package:bhavya_portfolio/model/service_model.dart';
import 'package:flutter/material.dart';

class HomeData {
  HomeData._();

  static const introText =
      'I build fast, scalable mobile apps using Flutter, Firebase, and clean architecture.';
  static const introHighlight = 'fast, scalable mobile apps';

  static const navigationItems = [
    NavigationItem(title: 'Home', sectionIndex: 0),
    NavigationItem(title: 'About', sectionIndex: 1),
    NavigationItem(title: 'Services', sectionIndex: 2),
    NavigationItem(title: 'Projects', sectionIndex: 3),
    NavigationItem(title: 'Skills', sectionIndex: 4),
    NavigationItem(title: 'Why Me', sectionIndex: 5),
    NavigationItem(title: 'Contact', sectionIndex: 6),
  ];

  static const moons = [
    MoonData(size: 90, speed: 0.08, index: 0),
    MoonData(size: 70, speed: 0.12, index: 1),
    MoonData(size: 110, speed: 0.06, index: 2),
    MoonData(size: 65, speed: 0.15, index: 3),
    MoonData(size: 55, speed: 0.18, index: 4),
  ];

  static const skills = [
    'Flutter – Advanced',
    'Dart – Advanced',
    'Responsive UI – Advanced',
    'Material Design – Advanced',
    'GetX – Advanced',
    'BLoC / Cubit – Advanced',
    'Provider – Proficient',
    'Riverpod – Proficient',
    'Clean Architecture – Advanced',
    'SOLID Principles – Advanced',
    'Firebase – Advanced',
    'Firebase Authentication – Advanced',
    'Cloud Firestore – Advanced',
    'Firebase Cloud Messaging – Proficient',
    'REST APIs – Advanced',
    'JSON Serialization – Advanced',
    'Dio / HTTP – Advanced',
    'Local Storage – Proficient',
    'SQLite / Hive – Proficient',
    'Git & GitHub – Advanced',
    'Unit & Widget Testing – Proficient',
    'Flutter DevTools – Proficient',
    'Performance Optimization – Advanced',
    'Animations – Advanced',
    'Push Notifications – Proficient',
    'Google Maps Integration – Proficient',
    'CI/CD – Proficient',
    'Play Store & App Store Release – Proficient',
  ];

  static const featuredProject = ProjectModel(
    title: 'Play Pitch',
    subtitle:
        'A smart box cricket & ground booking app where users can find nearby grounds, check live slot availability, and book matches instantly.',
    techStack: ['Flutter', 'Firebase', 'BLoC', 'Google Maps', 'REST API'],
    result:
        'Built a scalable real-time booking system with smooth UI, slot management, and secure authentication.',
    youtube: 'YOUR_YOUTUBE_LINK',
    githubUrl: 'YOUR_GITHUB_LINK',
  );

  static const projects = [
    ProjectModel(
      title: 'Finance Manager',
      subtitle: 'Manage daily expenses easily',
      techStack: ['Flutter', 'GetX', 'REST API'],
      result: 'Optimized UI for smooth performance',
    ),
    ProjectModel(
      title: 'My Resume',
      subtitle: 'Flutter Web portfolio',
      liveUrl: 'https://giniyabhavyaa.github.io/bhavya-resume/',
      githubUrl: 'https://github.com/giniyabhavyaa/bhavya-resume',
      techStack: ['Flutter Web', 'Responsive UI'],
      result: 'Fast loading and responsive design',
    ),
    ProjectModel(
      title: 'Shopping App',
      subtitle: 'API based shopping app',
      youtube: 'https://www.youtube.com/watch?v=WN-BKOdYuWw',
      githubUrl: 'https://github.com/giniyabhavyaa/bhavya-resume',
      techStack: ['Flutter', 'REST API', 'GetX'],
      result: 'Smooth product browsing experience',
    ),
  ];

  static const features = [
    FeatureModel(
      title: 'Clean & Maintainable Code',
      description:
          'I write structured and reusable Flutter code following clean architecture principles. My focus is on readability, scalability, and long-term maintainability so future updates and feature additions become easier and faster for any growing application.',
      icon: Icons.code_rounded,
    ),
    FeatureModel(
      title: 'Fast Delivery',
      description:
          'I prioritize efficient development workflows and rapid implementation without compromising quality. From UI development to API integration, I ensure smooth execution and timely delivery with consistent performance optimization throughout the project lifecycle.',
      icon: Icons.flash_on_rounded,
    ),
    FeatureModel(
      title: 'Responsive Communication',
      description:
          'Clear communication is an important part of every successful project. I provide regular progress updates, quick responses, and transparent collaboration to ensure clients always stay informed during development.',
      icon: Icons.chat_rounded,
    ),
    FeatureModel(
      title: 'Scalable App Architecture',
      description:
          'I build applications with scalability and performance in mind from the beginning. Using proper state management, modular structure, and optimized architecture, the app remains stable, maintainable, and ready for future business growth.',
      icon: Icons.architecture_rounded,
    ),
  ];

  static const services = [
    ServiceModel(
      icon: Icons.phone_android,
      title: '📱 Mobile App Development',
      description:
          'Building high-performance Flutter apps with smooth user experience.',
    ),
    ServiceModel(
      icon: Icons.api,
      title: '🔗 API Integration & Backend Connectivity',
      description:
          'Secure REST API integration with Firebase & backend services.',
    ),
    ServiceModel(
      icon: Icons.design_services,
      title: '🎨 Responsive UI/UX Design',
      description:
          'Modern, responsive and visually appealing UI designs for all devices.',
    ),
  ];
}
