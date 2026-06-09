import 'package:flutter/material.dart';

import 'app_enum.dart';

ScreenType getScreenType(double width) => switch (width) {
  >= 1200 => ScreenType.desktop,
  >= 768  => ScreenType.laptop,
  _       => ScreenType.mobile,
};


extension ResponsiveExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= 600 &&
          MediaQuery.of(this).size.width < 1100;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1100;
}