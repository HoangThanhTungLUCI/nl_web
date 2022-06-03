import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/custom_dropdown_button.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciDropdownNormal extends StatefulWidget {
  final List<String> listItem;
  final String? hint;
  final ValueChanged<String?> onChangedValue;
  final String? selectedValue;
  final DropdownSize dropdownSize;
  final double? width;

  LuciDropdownNormal(
      {super.key,
      required this.listItem,
      this.hint,
      required this.onChangedValue,
      this.selectedValue,
      this.width,
      this.dropdownSize = DropdownSize.medium});

  @override
  _LuciDropdownNormalState createState() => _LuciDropdownNormalState();
}

class _LuciDropdownNormalState extends State<LuciDropdownNormal> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      dropdownSize: widget.dropdownSize,
      hint: widget.hint ?? '',
      dropdownItems: widget.listItem,
      buttonDecoration: BoxDecoration(
          color: AppColor.mCInk50,
          border: Border.all(color: AppColor.mCInk300),
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
      dropdownDecoration: BoxDecoration(
          color: AppColor.mCWhite,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
      value: selectedValue,
      itemHeight: 40,
      dropdownWidth: 230,
      buttonWidth: widget.width ??
          widget.dropdownSize.toWidthButtonBySize(DropdownType.normal),
      buttonHeight: widget.dropdownSize.toHeightButtonBySize(),
      icon: Icon(
        Icons.arrow_drop_down_outlined,
        size: AppDimens.mIconNormal,
      ),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.onChangedValue(value);
        });
      },
      selectedItemBuilder: (context) {
        return widget.listItem.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                '${selectedValue ?? widget.hint} ',
                style: widget.dropdownSize
                    .toSTBtnDropdown()
                    .copyWith(color: AppColor.mCInk700),
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
