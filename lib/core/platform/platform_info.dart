import 'package:flutter/foundation.dart';

abstract class PlatformInfo {
  bool get isWebPlatform;

  bool get isMobilePlatform;

  bool get isDesktop;

  bool get isiOSPlatform;

  bool get isAndroidPlatform;
}

class PlatformInfoImpl implements PlatformInfo {
  PlatformInfoImpl._privateConstructor();

  static final PlatformInfoImpl _instance =
  PlatformInfoImpl._privateConstructor();

  static PlatformInfoImpl get instance => _instance;

  @override
  bool get isAndroidPlatform => defaultTargetPlatform == TargetPlatform.android;

  @override
  bool get isiOSPlatform => defaultTargetPlatform == TargetPlatform.iOS;

  @override
  bool get isMobilePlatform => isAndroidPlatform || isiOSPlatform;

  @override
  bool get isWebPlatform => !isDesktop && !isMobilePlatform;

  @override
  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows;
}
