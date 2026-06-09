class ProjectModel {
  final String title;
  final String subtitle;
  final String? liveUrl;
  final String? githubUrl;
  final String? youtube;

  final List<String> techStack;
  final String result;

  ProjectModel({
    required this.title,
    required this.subtitle,
    this.liveUrl,
    this.githubUrl,
    this.youtube,
    this.techStack = const [],
    this.result = "",
  });
}