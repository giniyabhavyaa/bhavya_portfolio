import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  bool get isMobileScreen => MediaQuery.of(this).size.width < 600;

  bool get isTabletScreen =>
      MediaQuery.of(this).size.width >= 600 &&
      MediaQuery.of(this).size.width < 1100;

  bool get isDesktopScreen => MediaQuery.of(this).size.width >= 1100;
}
