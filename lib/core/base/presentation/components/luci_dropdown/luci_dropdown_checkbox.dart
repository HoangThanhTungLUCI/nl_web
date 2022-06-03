import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/dropdown_button.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciDropdownCheckbox extends StatefulWidget {
  final List<String> listItem;
  final String? hint;
  final ValueChanged<String?> onChangedValue;
  final String? selectedValue;
  final DropdownSize dropdownSize;

  LuciDropdownCheckbox(
      {super.key,
      required this.listItem,
      this.hint,
      required this.onChangedValue,
      this.selectedValue,
      this.dropdownSize = DropdownSize.medium});

  @override
  _LuciDropdownCheckboxState createState() => _LuciDropdownCheckboxState();
}

class _LuciDropdownCheckboxState extends State<LuciDropdownCheckbox> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        sufIcon: selectedItems.isEmpty
            ? SizedBox()
            : IconButton(
                onPressed: () {
                  setState(() {
                    selectedItems.clear();
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
        icon: Icon(
          Icons.arrow_drop_down,
          color: AppColor.mCBlue400,
        ),
        isExpanded: true,
        hint: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            widget.hint ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppStyles.mSTH300.copyWith(color: AppColor.mCBlue400),
          ),
        ),
        items: widget.listItem.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        _isSelected
                            ? const Icon(
                                Icons.check_box_outlined,
                                color: AppColor.mCBlue400,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank,
                                color: AppColor.mCInk500,
                              ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            item,
                            style: AppStyles.mSTBaseLineNormal,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        buttonWidth: selectedItems.isEmpty
            ? widget.dropdownSize.toWidthButtonBySize(DropdownType.checkbox)
            : widget.dropdownSize.toWidthButtonBySize(DropdownType.checkbox) +
                70,
        buttonHeight: widget.dropdownSize.toHeightButtonBySize(),
        dropdownWidth: 230,
        dropdownMaxHeight: 200,
        itemHeight: 40,
        itemPadding: EdgeInsets.zero,
        buttonDecoration: BoxDecoration(
            color: AppColor.mCBlue50,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
        dropdownDecoration: BoxDecoration(
            color: AppColor.mCWhite,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8))),
        selectedItemBuilder: (context) {
          return widget.listItem.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '(${selectedItems.length}) ${widget.hint}',
                      style: widget.dropdownSize
                          .toSTBtnDropdown()
                          .copyWith(color: AppColor.mCBlue400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}
