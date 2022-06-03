import 'package:nl_web/core/style/style.dart';

enum TextFieldSize { large, medium }

extension TextFieldByType on TextFieldSize {
  double toSizeTextFieldBySize() {
    double result = 0;
    switch (this) {
      case TextFieldSize.large:
        result = AppDimens.mHeightTextFieldLarge;
        break;
      case TextFieldSize.medium:
        result = AppDimens.mHeightTextFieldMedium;
        break;
    }
    return result;
  }
}
