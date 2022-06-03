import 'package:flutter/material.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

enum FlagType { normal, info, success, warning, error }

extension SectionMessageByType on FlagType {
  Color backgroundColorByType() {
    Color result;
    switch (this) {
      case FlagType.info:
        result = AppColor.mCSecondary500;
        break;
      case FlagType.success:
        result = AppColor.mCGreen400;
        break;
      case FlagType.warning:
        result = AppColor.mCOrange200;
        break;
      case FlagType.error:
        result = AppColor.mCRed400;
        break;
      case FlagType.normal:
      default:
        result = AppColor.mCWhite;
    }
    return result;
  }

  Color contentColorByType() {
    Color result;
    switch (this) {
      case FlagType.info:
      case FlagType.success:
      case FlagType.error:
        result = AppColor.mCWhite;
        break;
      case FlagType.warning:
      case FlagType.normal:
      default:
        result = AppColor.mCInk900;
    }
    return result;
  }

  Widget iconByType() {
    Widget result;
    switch (this) {
      case FlagType.normal:
        result = ImageIcon(
          AssetImage(ImagesPath.information),
          color: AppColor.mCBlue400,
          size: AppDimens.mIconNormal,
        );
        break;
      case FlagType.info:
        result = ImageIcon(
          AssetImage(ImagesPath.information),
          color: AppColor.mCBlue400,
          size: AppDimens.mIconNormal,
        );
        break;
      case FlagType.success:
        result = ImageIcon(
          AssetImage(ImagesPath.confirmation),
          color: AppColor.mCWhite,
          size: AppDimens.mIconNormal,
        );
        break;
      case FlagType.warning:
        result = ImageIcon(
          AssetImage(ImagesPath.icWarning),
          color: AppColor.mCInk900,
          size: AppDimens.mIconNormal,
        );
        break;
      case FlagType.error:
      default:
        result = ImageIcon(
          AssetImage(ImagesPath.danger),
          color: AppColor.mCWhite,
          size: AppDimens.mIconNormal,
        );
    }
    return result;
  }

  Color buttonColorByType() {
    Color result;
    switch (this) {
      case FlagType.info:
        result = AppColor.mCBlue300;
        break;
      case FlagType.success:
        result = AppColor.mCGreen300;
        break;
      case FlagType.warning:
        result = AppColor.mCOrange300;
        break;
      case FlagType.error:
        result = AppColor.mCRed300;
        break;
      case FlagType.normal:
      default:
        result = AppColor.mCWhite;
    }
    return result;
  }
}
