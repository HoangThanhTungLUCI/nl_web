import 'package:nl_web/core/style/style.dart';

enum SwitchSize { small, medium }

extension SwitchBySize on SwitchSize {
  double getDimensionSwitch() {
    double width = 0;
    switch (this) {
      case SwitchSize.medium:
        width = AppDimens.mSwitchSizeMedium;
        break;
      case SwitchSize.small:
        width = AppDimens.mSwitchSizeSmall;
        break;
    }
    return width;
  }
}
