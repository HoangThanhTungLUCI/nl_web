import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/custom_dropdown_form_field.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciDropdownTextField2<T> extends StatefulWidget {
  final List<T> listItem;
  final String? hint;
  final ValueChanged<T?> onChangedValue;
  final ValueChanged<T>? onChangedTextField;
  final T? selectedValue;
  final DropdownSize dropdownSize;

  LuciDropdownTextField2(
      {super.key,
      required this.listItem,
      this.hint,
      required this.onChangedValue,
      this.onChangedTextField,
      this.selectedValue,
      this.dropdownSize = DropdownSize.medium});

  @override
  _LuciDropdownTextField2State<T> createState() =>
      _LuciDropdownTextField2State<T>();
}

class _LuciDropdownTextField2State<T> extends State<LuciDropdownTextField2<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: widget.dropdownSize.toHeightButtonBySize(),
      child: DropdownFormField<T>(
        onEmptyActionPressed: () async {},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            labelStyle: AppStyles.mSTBaseLineNormal,
            hintStyle: AppStyles.mSTBaseLineNormal,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal))),
            suffixIcon: Icon(Icons.arrow_drop_down),
            labelText:
                widget.selectedValue != null ? null : 'Choose something'),
        onChanged: (str) {
          widget.onChangedValue(str);
        },
        displayItemFn: (item) => Text(
          item?.toString() ?? widget.selectedValue?.toString() ?? '',
          style: AppStyles.mSTBaseLineNormal,
        ),
        findFn: (str) async => widget.listItem,
        filterFn: (item, str) =>
            item.toString().toLowerCase().contains(str.toLowerCase()),
        dropdownItemFn: (item, position, focused, lastSelectedItem, onTap) =>
            ListTile(
          title: Text(
            item.toString(),
            style: AppStyles.mSTBaseLineNormal,
          ),
          tileColor: focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
          onTap: onTap,
        ),
      ),
    );
  }
}
