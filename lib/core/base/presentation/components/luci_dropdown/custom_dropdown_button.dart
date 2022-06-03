import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/dropdown_button.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Widget? sufIcon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color? textColor;
  final DropdownSize dropdownSize;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.sufIcon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.textColor,
    required this.dropdownSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              hint,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: dropdownSize
                  .toSTBtnDropdown()
                  .copyWith(color: textColor ?? Theme.of(context).hintColor),
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.mSTBaseLineNormal,
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
        sufIcon: sufIcon,
        iconSize: iconSize ?? 12,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding:
            buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black45,
              ),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,
        dropdownWidth: dropdownWidth ?? 140,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}
