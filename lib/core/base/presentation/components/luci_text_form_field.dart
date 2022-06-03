import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nl_web/core/enums/textfield_size.dart';
import 'package:nl_web/core/enums/textfield_type.dart';
import 'package:nl_web/core/style/style.dart';

class LuciTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onSubmit;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnable;
  final bool readOnly;
  final bool filled;
  final bool isDense;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? errorIcon;
  final Widget? correctIcon;
  final Widget? correctMessage;
  final Widget? errorMessage;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;

  final TextFieldType type;
  final TextFieldSize size;
  final bool submitted;
  const LuciTextFormField({
    Key? key,
    this.validator,
    this.isEnable = true,
    this.inputFormat,
    required this.controller,
    this.keyboardType,
    this.onSubmit,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.filled = false,
    this.isDense = false,
    this.fillColor = AppColor.mCInk200,
    this.textAlign,
    this.maxLines = 1,
    this.minLines,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlignVertical = TextAlignVertical.center,
    this.style,
    this.contentPadding,
    this.maxLength,
    this.buildCounter,
    this.hintStyle,
    required this.hintText,
    this.borderRadius = 6,
    this.type = TextFieldType.normal,
    this.size = TextFieldSize.large,
    this.errorIcon,
    this.labelText = '',
    this.submitted = false,
    this.correctIcon,
    this.correctMessage,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<LuciTextFormField> createState() => _LuciTextFormFieldState();
}

class _LuciTextFormFieldState extends State<LuciTextFormField> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _name = '';
  void _submit() {
    setState(() => _submitted = !_submitted);
    if (_formKey.currentState!.validate()) {
      widget.onSubmit!(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.size.toSizeTextFieldBySize();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.labelText),
            ],
          ),
          const SizedBox(height: AppDimens.mSpaceXSmall4),
          Row(
            children: [
              SizedBox(
                width: 280,
                height: height,
                child: TextFormField(
                  controller: widget.controller,
                  minLines: widget.minLines,
                  scrollPhysics: const BouncingScrollPhysics(),
                  style: widget.size == TextFieldSize.large
                      ? AppStyles.mSTLinkLarge
                      : AppStyles.mSTBaseLineNormal,
                  cursorColor: Colors.black,
                  cursorWidth: 1.5,
                  maxLength: widget.maxLength,
                  buildCounter: widget.buildCounter,
                  textAlignVertical: widget.textAlignVertical,
                  textAlign: widget.textAlign ?? TextAlign.start,
                  decoration: InputDecoration(
                    fillColor: widget.fillColor,
                    filled: widget.filled,
                    contentPadding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimens.mRadiusNormal),
                      borderSide: const BorderSide(
                        color: AppColor.mCSecondary300,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimens.mRadiusNormal),
                      borderSide: BorderSide(
                          color: widget.submitted
                              ? widget.controller.text.isEmpty
                                  ? AppColor.mCRed400
                                  : AppColor.mCGreen400
                              : AppColor.mCInk300,
                          width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDimens.mRadiusNormal),
                      borderSide: const BorderSide(
                          color: AppColor.mCInk300, width: 1.0),
                    ),
                    suffixIcon: widget.suffixIcon,
                    prefixIcon: widget.prefixIcon,
                    hintText: widget.hintText,
                    hintStyle: (widget.size == TextFieldSize.large) ? AppStyles.mSTLinkMedium:AppStyles.mSTLinkSmall.copyWith(color: Colors.grey.shade200),
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                  validator: widget.validator,
                  enabled: widget.isEnable,
                  inputFormatters: widget.inputFormat,
                  keyboardType: widget.keyboardType,
                  focusNode: widget.focusNode,
                  maxLines: widget.maxLines,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap != null
                      ? widget.onTap as void Function()?
                      : () {},
                  onFieldSubmitted: widget.onFieldSubmitted,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  onChanged: (text) => setState(() => _name = text),
                ),
              ),
              const SizedBox(
                width: AppDimens.mSpaceXSmall,
              ),
              SizedBox(
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
          ),
          _buildIconError(),
        ],
      ),
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
