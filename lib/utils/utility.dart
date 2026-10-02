import 'package:url_launcher/url_launcher.dart';

class Utility {
  Utility._();

  static const emailAddress = 'giniyabhavyaa@gmail.com';
  static const githubUrl = 'https://github.com/giniyabhavyaa';
  static const resumeUrl = 'https://giniyabhavyaa.github.io/bhavya-resume/';
  static const linkedInUrl =
      'https://www.linkedin.com/in/bhavyaa-bhavya-giniya-826b9b39a/';

  static Future<bool> launchExternalUrl(String url) {
    return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future<bool> launchEmail({String? subject, String? body}) {
    return launchUrl(
      Uri(
        scheme: 'mailto',
        path: emailAddress,
        queryParameters: {
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        },
      ),
      mode: LaunchMode.externalApplication,
    );
  }
}
