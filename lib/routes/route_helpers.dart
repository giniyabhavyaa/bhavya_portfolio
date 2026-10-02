import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/home/home_screen.dart';

class RouteHelpers {
  static const String homeScreen = '/';

  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => const HomeScreen()),
  ];
}
