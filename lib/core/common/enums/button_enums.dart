import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

enum ButtonType {
  primary,
  secondary,
  disabled,
}

enum ButtonSize { large, medium, small }

extension ButtonByType on ButtonType {
  Color backgroundColorByType() {
    Color result;
    switch (this) {
      case ButtonType.primary:
        result = AppColor.mCPrimary;
        break;
      case ButtonType.disabled:
        result = AppColor.mCInk200;
        break;
      case ButtonType.secondary:
        result = AppColor.mCInk100;
        break;
      default:
        result = AppColor.mCPrimary;
    }
    return result;
  }

  Color contentColorByType() {
    Color result;
    switch (this) {
      case ButtonType.primary:
        result = AppColor.mCWhite;
        break;
      case ButtonType.disabled:
        result = AppColor.mCInk500;
        break;
      case ButtonType.secondary:
        result = AppColor.mCInk900;
        break;
      default:
        result = AppColor.mCPrimary;
    }
    return result;
  }
}

extension ButtonBySize on ButtonSize {
  double toWidthButtonBySize() {
    double width = 0;
    switch (this) {
      case ButtonSize.large:
        width = AppDimens.mButtonSizeLarge;
        break;
      case ButtonSize.medium:
        width = AppDimens.mButtonSizeMedium;
        break;
      case ButtonSize.small:
        width = AppDimens.mButtonSizeSmall;
        break;
    }
    return width;
  }

  double toHeightButtonBySize() {
    double height = 0;
    switch (this) {
      case ButtonSize.large:
        height = AppDimens.mHeightButtonLarge;
        break;
      case ButtonSize.medium:
        height = AppDimens.mHeightButtonMedium;
        break;
      case ButtonSize.small:
        height = AppDimens.mHeightButtonSmall;
        break;
    }
    return height;
  }

  double toIconBySize() {
    double size = 0;
    switch (this) {
      case ButtonSize.large:
        size = AppDimens.mIconNormal;
        break;
      case ButtonSize.medium:
      case ButtonSize.small:
        size = AppDimens.mIconSmall;
        break;
    }
    return size;
  }

  TextStyle toSTButtonBySize(ButtonType buttonType) {
    TextStyle textStyle;
    switch (this) {
      case ButtonSize.large:
        textStyle =
            AppStyles.mSTH500.copyWith(color: buttonType.contentColorByType());
        break;
      case ButtonSize.medium:
        textStyle =
            AppStyles.mSTH400.copyWith(color: buttonType.contentColorByType());
        break;
      case ButtonSize.small:
      default:
        textStyle =
            AppStyles.mSTH300.copyWith(color: buttonType.contentColorByType());
        break;
    }
    return textStyle;
  }
}
