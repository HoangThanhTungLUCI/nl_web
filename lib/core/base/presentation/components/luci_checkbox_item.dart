import 'package:flutter/material.dart';
import 'package:nl_web/core/common/enums/checkbox_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciCheckboxItem extends StatefulWidget {
  final String data;
  final CheckboxType checkboxType;
  final bool isChecked;
  final bool isEnable;
  final ValueChanged<bool?>? onChanged;

  const LuciCheckboxItem(
      {Key? key,
      required this.data,
      this.isChecked = true,
      this.onChanged,
      this.isEnable = true,
      this.checkboxType = CheckboxType.defaultCB})
      : super(key: key);

  @override
  LuciCheckboxItemState createState() => LuciCheckboxItemState();
}

class LuciCheckboxItemState extends State<LuciCheckboxItem> {
  late bool _isCheck;
  late bool _isEnable;
  late CheckboxType _checkboxType;

  @override
  void initState() {
    super.initState();
    _isCheck = widget.isChecked;
    _checkboxType = widget.checkboxType;
    _isEnable = widget.isEnable;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isEnable && _checkboxType != CheckboxType.invalid
          ? () {
              _handleOnClick();
            }
          : null,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _checkboxType.getIcon(
              isEnable: _isEnable,
              isChecked: _isCheck,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: AppDimens.mSpaceXSmall4),
                child: Text(
                  widget.data,
                  softWrap: true,
                  style: _isEnable && _checkboxType != CheckboxType.invalid
                      ? AppStyles.mSTBaseLineNormal
                      : AppStyles.mSTBaseLineNormal
                          .copyWith(color: AppColor.mCInk500),
                ),
              ),
            )
          ]),
    );
  }

  void _handleOnClick() {
    setState(() {
      _isCheck = !_isCheck;
      if (widget.onChanged != null &&
          _checkboxType != CheckboxType.indeterminate) {
        widget.onChanged!(_isCheck);
      }
    });
  }
}
