import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/custom_dropdown_button.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciDropdownOnlyText extends StatefulWidget {
  final List<String> listItem;
  final String? hint;
  final ValueChanged<String?> onChangedValue;
  final String? selectedValue;
  final DropdownSize dropdownSize;
  final double? width;
  final Color? backgroundColor;

  LuciDropdownOnlyText(
      {super.key,
      required this.listItem,
      this.hint,
      required this.onChangedValue,
      this.selectedValue,
      this.width,
      this.backgroundColor,
      this.dropdownSize = DropdownSize.medium});

  @override
  _LuciDropdownOnlyTextState createState() => _LuciDropdownOnlyTextState();
}

class _LuciDropdownOnlyTextState extends State<LuciDropdownOnlyText> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      dropdownSize: widget.dropdownSize,
      hint: widget.hint ?? '',
      dropdownItems: widget.listItem,
      buttonDecoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColor.mCBlue50,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
      dropdownDecoration: BoxDecoration(
          color: AppColor.mCWhite,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
      value: selectedValue,
      itemHeight: 40,
      dropdownWidth: 230,
      buttonWidth: selectedValue == null
          ? widget.dropdownSize.toWidthButtonBySize(DropdownType.checkbox)
          : widget.dropdownSize.toWidthButtonBySize(DropdownType.checkbox) + 20,
      buttonHeight: widget.dropdownSize.toHeightButtonBySize(),
      icon: Icon(
        Icons.arrow_drop_down_outlined,
        color: AppColor.mCBlue400,
        size: AppDimens.mIconNormal,
      ),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.onChangedValue(value);
        });
      },
      sufIcon: selectedValue == null
          ? SizedBox()
          : IconButton(
              onPressed: () {
                setState(() {
                  selectedValue = null;
                });
              },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.close,
                color: AppColor.mCInk700,
                size: AppDimens.mIconSmall,
              ),
            ),
      selectedItemBuilder: (context) {
        return widget.listItem.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                '${selectedValue ?? widget.hint} ',
                style: widget.dropdownSize
                    .toSTBtnDropdown()
                    .copyWith(color: AppColor.mCBlue400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ).toList();
      },
    );
  }
}
