import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

enum TextFieldType {
  normal,
  filled,
  disabled,
}

extension TextFieldByType on TextFieldType {
  Color backgroundColorByType() {
    Color result;
    switch (this) {
      case TextFieldType.normal:
        result = AppColor.mCWhite;
        break;
      case TextFieldType.filled:
        result = AppColor.mCInk200;
        break;
      case TextFieldType.disabled:
        result = AppColor.mCInk500;
        break;
      default:
        result = AppColor.mCPrimary;
    }
    return result;
  }

  Color textColorByType() {
    Color result;
    switch (this) {
      case TextFieldType.normal:
      case TextFieldType.filled:
        result = AppColor.mCInk900;
        break;
      case TextFieldType.disabled:
        result = AppColor.mCInk500;
        break;
      default:
        result = AppColor.mCInk900;
    }
    return result;
  }
}
