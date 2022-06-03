part of style;

Color mBarrierDialogColor = Colors.grey.withOpacity(0.4);

class AppColor {
  /// Brand
// Primary color: The predominant color in UI and is normally connected with the main color of the brand.
// Secondary color: Complement the primary color.
  static const Color mCPrimary = Color(0xff98272B);
  static const Color mCSecondary = Color(0xff4431ED);
  static const Color mCSmartOne = Color(0xff922028);

  /// Primary
// Normally used for backgrounds, borders, texts and tertiary buttons and actions.
  static const Color mCPrimary900 = Color(0xff521F00);
  static const Color mCPrimary800 = Color(0xff6D2201);
  static const Color mCPrimary700 = Color(0xff872104);
  static const Color mCPrimary600 = Color(0xff9F1E08);
  static const Color mCPrimary500 = Color(0xffB7180E);
  static const Color mCPrimary400 = Color(0xff98272B);
  static const Color mCPrimary300 = Color(0xffDA3D3C);
  static const Color mCPrimary200 = Color(0xffE56A65);
  static const Color mCPrimary100 = Color(0xffEF9690);
  static const Color mCPrimary75 = Color(0xffF7C2BC);
  static const Color mCPrimary50 = Color(0xffFDEDEB);

  /// Primary
// Normally used for backgrounds, borders, texts and tertiary buttons and actions.
  static const Color mCSecondary900 = Color(0xff201258);
  static const Color mCSecondary800 = Color(0xff251A75);
  static const Color mCSecondary700 = Color(0xff272492);
  static const Color mCSecondary600 = Color(0xff2E34AD);
  static const Color mCSecondary500 = Color(0xff394BC8);
  static const Color mCSecondary400 = Color(0xff4565E1);
  static const Color mCSecondary300 = Color(0xff647CEA);
  static const Color mCSecondary200 = Color(0xff8595F1);
  static const Color mCSecondary100 = Color(0xffA7B1F7);
  static const Color mCSecondary75 = Color(0xffCACFFB);
  static const Color mCSecondary50 = Color(0xffEFF0FE);

  /// Neutral
// Normally used for backgrounds, borders, texts and tertiary buttons and actions.
  static const Color mCInk900 = Color(0xff20262B);
  static const Color mCInk800 = Color(0xff323B41);
  static const Color mCInk700 = Color(0xff475057);
  static const Color mCInk600 = Color(0xff68737B);
  static const Color mCInk500 = Color(0xffA7B1B9);
  static const Color mCInk400 = Color(0xffC6CED5);
  static const Color mCInk300 = Color(0xffD6DCE0);
  static const Color mCInk200 = Color(0xffE0E5E9);
  static const Color mCInk100 = Color(0xffEFF2F3);
  static const Color mCInk50 = Color(0xffF5F8F8);
  static const Color mCWhite = Color(0xffFFFFFF);

  /// Semantic
// Green: For success or confirmation messages and actions.
// Blue: To draw users attention for system messages and status with an informative intention.
// Orange: For critical information or warning messages.
// Red: For negative or destructive messages and actions.

// green
  static const Color mCGreen500 = Color(0xff006644);
  static const Color mCGreen400 = Color(0xff00875A);
  static const Color mCGreen300 = Color(0xff36B37E);
  static const Color mCGreen200 = Color(0xff57D9A3);
  static const Color mCGreen100 = Color(0xff79F2C0);
  static const Color mCGreen75 = Color(0xffABF5D1);
  static const Color mCGreen50 = Color(0xffE3FCEF);

// orange
  static const Color mCOrange500 = Color(0xffDF7F16);
  static const Color mCOrange400 = Color(0xffF79428);
  static const Color mCOrange300 = Color(0xffFFAB00);
  static const Color mCOrange200 = Color(0xffFECC40);
  static const Color mCOrange100 = Color(0xffFFE380);
  static const Color mCOrange75 = Color(0xffFFF0B3);
  static const Color mCOrange50 = Color(0xffFFFAE6);

// red
  static const Color mCRed500 = Color(0xffBF2600);
  static const Color mCRed400 = Color(0xffDE350B);
  static const Color mCRed300 = Color(0xffFF5630);
  static const Color mCRed200 = Color(0xffFF7452);
  static const Color mCRed100 = Color(0xffFF8F73);
  static const Color mCRed75 = Color(0xffFFBDAD);
  static const Color mCRed50 = Color(0xffFFEBE6);

  /// Blue
  static const Color mCBlue900 = Color(0xff201258);
  static const Color mCBlue800 = Color(0xff251A75);
  static const Color mCBlue700 = Color(0xff272492);
  static const Color mCBlue600 = Color(0xff2E34AD);
  static const Color mCBlue500 = Color(0xff394BC8);
  static const Color mCBlue400 = Color(0xff4565E1);
  static const Color mCBlue300 = Color(0xff647CEA);
  static const Color mCBlue200 = Color(0xff8595F1);
  static const Color mCBlue100 = Color(0xffA7B1F7);
  static const Color mCBlue75 = Color(0xffCACFFB);
  static const Color mCBlue50 = Color(0xffEFF0FE);

// shadow
  static const Color mCShadow = Color(0xff011222);

// background blur
  static const Color mCBgBlur = Color(0xff000000);

// Misc
  static const Gradient mCGradientBrand = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mCPrimary, mCSecondary],
  );

  static const Gradient mCSkeleton = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mCInk100, mCInk300],
  );
}
/*
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    static const buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
*/
