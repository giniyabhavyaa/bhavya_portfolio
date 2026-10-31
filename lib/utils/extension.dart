import 'package:flutter/material.dart';

import 'app_enum.dart';

ScreenType getScreenType(double width) => switch (width) {
  >= 1200 => ScreenType.desktop,
  >= 768 => ScreenType.laptop,
  _ => ScreenType.mobile,
};

extension ResponsiveExtension on BuildContext {
  bool get isMobile => MediaQuery.sizeOf(this).width < 768;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width >= 768 &&
      MediaQuery.sizeOf(this).width < 1200;

  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1200;
}
