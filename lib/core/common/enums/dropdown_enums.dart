import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

enum DropdownSize { medium, large }

enum DropdownType { normal, selectionTextField, onlyText, checkbox }

extension DropDownSizeBySize on DropdownSize {
  double toHeightButtonBySize() {
    double height = 0;
    switch (this) {
      case DropdownSize.medium:
        height = AppDimens.mHeightDropdownMedium;
        break;
      case DropdownSize.large:
        height = AppDimens.mHeightDropdownLarge;
        break;
    }
    return height;
  }

  TextStyle toSTBtnDropdown() {
    TextStyle result;
    switch (this) {
      case DropdownSize.large:
        result = AppStyles.mSTH400;
        break;
      case DropdownSize.medium:
      default:
        result = AppStyles.mSTH300;
        break;
    }
    return result;
  }

  double toWidthButtonBySize(DropdownType dropdownType) {
    double width = 0;
    if (this == DropdownSize.medium) {
      switch (dropdownType) {
        case DropdownType.normal:
        case DropdownType.checkbox:
        case DropdownType.onlyText:
          width = 96;
          break;
        case DropdownType.selectionTextField:
          width = 280;
          break;
      }
    } else {
      switch (dropdownType) {
        case DropdownType.normal:
        case DropdownType.checkbox:
        case DropdownType.onlyText:
          width = 77;
          break;
        case DropdownType.selectionTextField:
          width = 280;
          break;
      }
    }
    return width;
  }
}
