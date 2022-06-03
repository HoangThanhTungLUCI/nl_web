part of style;

class AppDimens {
// space
  static const double mSpaceXLarge = 52.0;
  static const double mSpaceLarge48 = 48.0;
  static const double mSpaceLarge = 40.0;
  static const double mSpaceMedium36 = 36.0;
  static const double mSpaceMedium = 32.0;
  static const double mSpaceNormal28 = 28.0;
  static const double mSpaceNormal = 24.0;
  static const double mSpaceSmall = 16.0;
  static const double mSpaceSmall14 = 14.0;
  static const double mSpaceXSmall = 12.0;
  static const double mSpaceXSmall8 = 8.0;
  static const double mSpaceXSmall4 = 4.0;
  static const double mSpaceXSmall2 = 2.0;

// padding
  static const double mPaddingLarge = 32;
  static const double mPaddingMedium24 = 24;
  static const double mPaddingNormal = 12;
  static const double mPaddingMedium = 16;
  static const double mPaddingSmall = 8;
  static const double mPaddingXSmall = 4;

// margin
  static const double mMarginXLarge = 52.0;
  static const double mMarginLarge48 = 48.0;
  static const double mMarginLarge = 40.0;
  static const double mMarginMedium36 = 36.0;
  static const double mMarginMedium = 32.0;
  static const double mMarginNormal28 = 28.0;
  static const double mMarginNormal = 24.0;
  static const double mMarginSmall = 16.0;
  static const double mMarginSmall14 = 14.0;
  static const double mMarginXSmall = 12.0;
  static const double mMarginXSmall8 = 8.0;
  static const double mMarginXSmall4 = 4.0;

// radius
  static const double mRadiusSmall = 2;
  static const double mRadiusSmall4 = 4;
  static const double mRadiusNormal = 6;
  static const double mRadiusNormal8 = 8;
  static const double mRadiusMedium = 10;
  static const double mRadiusLarge = 16;

// Font
  static const double mH1 = 24;
  static const double mH2 = 20;
  static const double mH3 = 18;
  static const double mH4 = 16;

  static const double m100 = 36;
  static const double m200 = 30;
  static const double m300 = 24;
  static const double m400 = 20;
  static const double m500 = 16;
  static const double m600 = 14;
  static const double m700 = 12;
  static const double m800 = 12;
  static const double m900 = 11;

  static const double mFontSizePrimary = 16;
  static const double mFontSizeSecondary = 14;

  static const double mFontSizeXLarge = 24;
  static const double mFontSizeLarge = 20;
  static const double mFontSizeMedium = 16;
  static const double mFontSizeNormal = 14;
  static const double mFontSizeSmall = 12;
  static const double mFontSizeSuperSmall = 11;

// Line height
  static const double mLineHeightXLarge48 = 48.0;
  static const double mLineHeightXLarge = 42.0;
  static const double mLineHeightLarge = 36.0;
  static const double mLineHeightMedium = 32.0;
  static const double mLineHeightMedium30 = 30.0;
  static const double mLineHeightNormal = 24.0;
  static const double mLineHeightSmall = 20.0;
  static const double mLineHeightSmall18 = 18.0;
  static const double mLineHeightXSmall = 16.0;

// Size Button
  static const double mButtonSizeLarge = 80.0;
  static const double mButtonSizeMedium = 67.0;
  static const double mButtonSizeSmall = 54.0;

  static const double mHeightButtonLarge = 44.0;
  static const double mHeightButtonMedium = 32.0;
  static const double mHeightButtonSmall = 28.0;

// Size Components
  static const double mHeightTextFieldLarge = 44.0;
  static const double mHeightTextFieldMedium = 32.0;

  static const double mHeightDropdownLarge = 44.0;
  static const double mHeightDropdownMedium = 34.0;

// Icon Size
  static const double mIconXLarge = 80.0;
  static const double mIconLarge = 40.0;
  static const double mIconMedium = 32.0;
  static const double mIconNormal = 24.0;
  static const double mIconSmall = 16.0;

  // Dialog Size
  static const double mDialogSizeSmall = 480.0;
  static const double mDialogSizeMedium = 580.0;
  static const double mDialogSizeLarge = 680.0;
  static const double mDialogSizeXLarge = 960.0;

  // Dialog Size
  static const double mSwitchSizeSmall = 32.0;
  static const double mSwitchSizeMedium = 40.0;

// Border
  static roundedTextFieldBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(mRadiusNormal),
      borderSide: BorderSide(color: color ?? AppColor.mCInk300, width: 1),
    );
  }

  static const paddingTextField = EdgeInsets.all(12);
}
