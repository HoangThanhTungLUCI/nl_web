import 'package:flutter/material.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

enum CheckboxType { defaultCB, indeterminate, invalid }

extension CheckboxByType on CheckboxType {
  Widget getIcon({bool isEnable = true, bool isChecked = false}) {
    Widget icon;
    switch (this) {
      case CheckboxType.defaultCB:
        if (isChecked) {
          if (isEnable) {
            icon = checkedCheckboxImg;
          } else {
            icon = checkedDisableCheckboxImg;
          }
        } else {
          if (isEnable) {
            icon = defaultCheckboxImg;
          } else {
            icon = disableCheckboxImg;
          }
        }
        break;
      case CheckboxType.indeterminate:
        if (isEnable) {
          icon = indeterminateCheckboxImg;
        } else {
          icon = indeterminateDisableCheckboxImg;
        }
        break;
      case CheckboxType.invalid:
        icon = invalidCheckboxImg;
        break;
    }
    return icon;
  }
}

// images
const Widget checkedCheckboxImg = Image(
  image: AssetImage(ImagesPath.checkedCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget checkedDisableCheckboxImg = Image(
  image: AssetImage(ImagesPath.checkedDisableCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget defaultCheckboxImg = Image(
  image: AssetImage(ImagesPath.defaultCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget disableCheckboxImg = Image(
  image: AssetImage(ImagesPath.disableCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget indeterminateCheckboxImg = Image(
  image: AssetImage(ImagesPath.indeterminateCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget indeterminateDisableCheckboxImg = Image(
  image: AssetImage(ImagesPath.indeterminateDisableCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
const Widget invalidCheckboxImg = Image(
  image: AssetImage(ImagesPath.invalidCheckbox),
  width: AppDimens.mIconNormal,
  height: AppDimens.mIconNormal,
  fit: BoxFit.scaleDown,
  alignment: Alignment.center,
);
