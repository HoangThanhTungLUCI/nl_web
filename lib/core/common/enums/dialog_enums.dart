import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

enum DialogType { normal, warning, alert, danger }

enum DialogSize { small, medium, large, xLarge }

extension DialogBySize on DialogSize {
  double toWidthDialogBySize() {
    double width = 0;
    switch (this) {
      case DialogSize.xLarge:
        width = AppDimens.mButtonSizeLarge;
        break;
      case DialogSize.large:
        width = AppDimens.mDialogSizeLarge;
        break;
      case DialogSize.medium:
        width = AppDimens.mButtonSizeMedium;
        break;
      case DialogSize.small:
        width = AppDimens.mButtonSizeSmall;
        break;
    }
    return width;
  }
}

extension DialogByType on DialogType {
  Color toHeaderContentColor() {
    Color result;
    switch (this) {
      case DialogType.danger:
        result = AppColor.mCWhite;
        break;
      case DialogType.warning:
      case DialogType.normal:
      case DialogType.alert:
      default:
        result = AppColor.mCInk900;
        break;
    }
    return result;
  }

  Color toHeaderBackgroundColor() {
    Color result;
    switch (this) {
      case DialogType.danger:
        result = AppColor.mCRed400;
        break;
      case DialogType.warning:
        result = AppColor.mCOrange400;
        break;
      case DialogType.normal:
      case DialogType.alert:
      default:
        result = AppColor.mCWhite;
        break;
    }
    return result;
  }
}
