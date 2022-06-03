import 'package:flutter/material.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

enum SectionMessageType { normal, confirmation, warning, error }

extension SectionMessageByType on SectionMessageType {
  Color backgroundColorByType() {
    Color result;
    switch (this) {
      case SectionMessageType.confirmation:
        result = AppColor.mCGreen50;
        break;
      case SectionMessageType.warning:
        result = AppColor.mCOrange50;
        break;
      case SectionMessageType.error:
        result = AppColor.mCRed50;
        break;
      case SectionMessageType.normal:
      default:
        result = AppColor.mCSecondary50;
    }
    return result;
  }

  Color textColorByType() {
    Color result;
    switch (this) {
      case SectionMessageType.confirmation:
        result = AppColor.mCGreen400;
        break;
      case SectionMessageType.error:
        result = AppColor.mCRed400;
        break;
      case SectionMessageType.warning:
      case SectionMessageType.normal:
      default:
        result = AppColor.mCInk900;
    }
    return result;
  }

  Widget iconColorByType() {
    Widget result;
    switch (this) {
      case SectionMessageType.normal:
        result = ImageIcon(
          AssetImage(ImagesPath.information),
          color: AppColor.mCBlue400,
          size: AppDimens.mIconNormal,
        );
        break;
      case SectionMessageType.confirmation:
        result = ImageIcon(
          AssetImage(ImagesPath.confirmation),
          color: AppColor.mCGreen400,
          size: AppDimens.mIconNormal,
        );
        break;
      case SectionMessageType.warning:
        result = ImageIcon(
          AssetImage(ImagesPath.icWarning),
          color: AppColor.mCOrange400,
          size: AppDimens.mIconNormal,
        );
        break;
      case SectionMessageType.error:
      default:
        result = ImageIcon(
          AssetImage(ImagesPath.danger),
          color: AppColor.mCRed400,
          size: AppDimens.mIconNormal,
        );
    }
    return result;
  }
}
