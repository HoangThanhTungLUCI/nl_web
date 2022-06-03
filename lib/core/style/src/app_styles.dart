part of style;

class AppStyles {
  static void setStyleDefault() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.mCInk900,
        systemNavigationBarIconBrightness: Brightness.light));
  }

  /// Heading
  static const mSTH900 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m900,
  );

  static const mSTH800 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m800,
  );

  static const mSTH700 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m700,
  );

  static const mSTH600 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m600,
  );

  static const mSTH500 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m500,
  );

  static const mSTH400 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m600,
  );

  static const mSTH300 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m700,
  );

  static const mSTH200 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m200,
  );

  static const mSTH100 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m100,
  );

  static const mSTL900 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m900,
  );

  static const mSTL800 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m800,
  );

  static const mSTL700 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m700,
  );

  static const mSTL600 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m600,
  );

  static const mSTL500 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m500,
  );

  static const mSTL400 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m400,
  );

  static const mSTL300 = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w500,
    fontSize: AppDimens.m300,
  );

  /// Paragraph
  static const mSTParaLarge = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeLarge,
  );
  static const mSTParaMedium = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeMedium,
  );
  static const mSTParaNormal = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeNormal,
  );
  static const mSTParaSmall = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeSmall,
  );

  /// Baseline
  static const mSTBaseLineXLarge = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeXLarge,
  );

  static const mSTBaseLineLarge = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeNormal,
  );

  static const mSTBaseLineMedium = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeNormal,
  );

  static const mSTBaseLineNormal = TextStyle(
    fontFamily: mFontRoboto,
    fontSize: AppDimens.mFontSizeNormal,
  );

  static const mSTBaseLineSmall = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeLarge,
  );

  static const mSTBaseLineXSmall = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeSuperSmall,
  );

  /// Links
  static const mSTLinkLarge = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeMedium,
  );

  static const mSTLinkMedium = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeNormal,
  );

  static const mSTLinkSmall = TextStyle(
    fontFamily: mFontRoboto,
    fontWeight: FontWeight.w400,
    fontSize: AppDimens.mFontSizeSmall,
  );
}
