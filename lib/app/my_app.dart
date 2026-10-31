import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../helpers/app_colors.dart';
import '../helpers/styles.dart';
import '../routes/route_helpers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bhavya Giniya - Flutter Developer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themeColor),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineSmall: dmSansW200.copyWith(fontSize: 28),
          titleLarge: dmSansW200.copyWith(fontSize: 20),
          bodyMedium: dmSansW200.copyWith(fontSize: 16),
        ),
      ),
      initialRoute: '/',
      getPages: RouteHelpers.routes,
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
    );
  }
}
