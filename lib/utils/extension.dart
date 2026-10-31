import 'package:flutter/material.dart';

import 'app_enums.dart';

extension ResponsiveExtension on BuildContext {
  DeviceType get deviceType {
    final width = MediaQuery.sizeOf(this).width;
    if (width < 600) return DeviceType.mobile;
    if (width < 1100) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  bool get isMobileScreen => deviceType == DeviceType.mobile;

  bool get isTabletScreen => deviceType == DeviceType.tablet;

  bool get isDesktopScreen => deviceType == DeviceType.desktop;
}
