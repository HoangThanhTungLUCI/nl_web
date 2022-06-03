import 'package:flutter/material.dart';
import 'package:nl_web/core/enums/textfield_size.dart';
import 'package:nl_web/core/enums/textfield_type.dart';
import 'package:nl_web/core/style/style.dart';

class LuciTextField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onSubmit;
  final TextEditingController controller;
  final int maxLines;
  final bool validate;
  final bool isEnable;
  final bool filled;
  final Color fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? errorIcon;
  final Widget? correctIcon;
  final Widget? correctMessage;
  final Widget? errorMessage;
  final int maxLength;
  final TextFieldType type;
  final TextFieldSize size;
  final bool obscureText;
  const LuciTextField({
    Key? key,
    required this.controller,
    this.validate = false,
    this.maxLines = 1,
    this.maxLength = 10,
    required this.hintText,
    this.isEnable = true,
    this.filled = false,
    this.fillColor = AppColor.mCInk200,
    this.prefixIcon,
    this.suffixIcon,
    this.type = TextFieldType.normal,
    this.size = TextFieldSize.large,
    this.obscureText = false,
    this.errorIcon,
    required this.onSubmit,
    this.correctIcon,
    this.errorMessage,
    this.correctMessage,
  }) : super(key: key);

  @override
  State<LuciTextField> createState() => _LuciTextFieldState();
}

class _LuciTextFieldState extends State<LuciTextField> {
  bool _submitted = false;
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _submitted = !_submitted);
    if (_buildIconError() == Container()) {
      widget.onSubmit!(widget.controller.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.size.toSizeTextFieldBySize();
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, TextEditingValue value, __) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 280,
                  height: height,
                  child: TextField(
                    onSubmitted: widget.onSubmit,
                    cursorColor: Colors.black,
                    cursorWidth: 2,
                    enabled: widget.isEnable,
                    textAlign: TextAlign.start,
                    obscureText: widget.obscureText,
                    style: (widget.size == TextFieldSize.large) ? AppStyles.mSTLinkLarge:AppStyles.mSTBaseLineNormal,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      fillColor: widget.fillColor,
                      filled: widget.filled,
                      contentPadding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
                        borderSide: const BorderSide(
                          color: AppColor.mCSecondary300,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
                        borderSide: BorderSide(
                            color: _submitted
                                ? widget.controller.text.isEmpty
                                    ? AppColor.mCRed400
                                    : AppColor.mCGreen400
                                : AppColor.mCInk300,
                            width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
                        borderSide: const BorderSide(
                            color: AppColor.mCInk300, width: 1.0),
                      ),
                      suffixIcon: widget.suffixIcon,
                      prefixIcon: widget.prefixIcon,
                    ),
                    controller: widget.controller,
                    maxLines: widget.maxLines,
                  ),
                ),
                _buildIconError(),
              ],
            ),
            SizedBox(
              width: AppDimens.mSpaceXSmall,
            ),
            Container(
              width: AppDimens.mSpaceXSmall2,
              height: height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: !_submitted
                      ? AppColor.mCInk300
                      : widget.controller.text.isEmpty
                          ? AppColor.mCRed400
                          : AppColor.mCGreen400,
                ),
                onPressed: _submit,
                child: Container(
                  color: _submitted == false
                      ? AppColor.mCInk300
                      : widget.controller.text.isEmpty
                          ? AppColor.mCRed400
                          : AppColor.mCGreen400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color backgroundColorByType() {
    Color result;
    switch (widget.type) {
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
    switch (widget.type) {
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

  Widget _buildIconError() {
    if (_submitted) {
      return SizedBox(
        height: AppDimens.mSpaceSmall,
        child: Row(
          children: [
            Container(
              child: widget.controller.text.isEmpty
                  ? widget.errorIcon
                  : widget.correctIcon,
            ),
            SizedBox(
              width: AppDimens.mSpaceXSmall4,
            ),
            SizedBox(
                child: widget.controller.text.isEmpty
                    ? widget.errorMessage
                    : widget.correctMessage),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  double sizeTextFieldBySize() {
    double result = 0;
    switch (widget.size) {
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
