import 'package:bhavya_portfolio/view/screens/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelpers {
  static const String homeScreen = '/';

  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => const HomeScreen()),
  ];
}
