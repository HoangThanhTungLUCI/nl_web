import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

class LuciRadioButtons<T> extends StatefulWidget {
  final List<T> data;
  final String? title;
  final bool isRequired;
  final ValueChanged<T?>? onChanged;

  const LuciRadioButtons(
      {Key? key,
      required this.data,
      required this.onChanged,
      this.title,
      this.isRequired = false})
      : super(key: key);

  @override
  State<LuciRadioButtons<T>> createState() => _LuciRadioButtonsState<T>();
}

class _LuciRadioButtonsState<T> extends State<LuciRadioButtons<T>> {
  T? value;

  bool get isEnable => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.title != null
            ? Container(
                margin: EdgeInsets.only(
                    left: AppDimens.mSpaceXSmall4,
                    bottom: AppDimens.mSpaceXSmall4),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.title!,
                        style: AppStyles.mSTH500,
                      ),
                      if (widget.isRequired)
                        TextSpan(
                          text: '*',
                          style: AppStyles.mSTH500
                              .copyWith(color: AppColor.mCRed400),
                        )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.data.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              widget.data[index].toString(),
              style: AppStyles.mSTBaseLineNormal,
            ),
            horizontalTitleGap: AppDimens.mSpaceXSmall4,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            enabled: isEnable,
            onTap: () => _handleChanged(widget.data[index]),
            leading: Radio<T>(
              value: widget.data[index],
              groupValue: value,
              onChanged: isEnable ? (value) => _handleChanged(value!) : null,
            ),
          ),
        ),
      ],
    );
  }

  void _handleChanged(T data) {
    setState(() {
      if (value == data) {
        value = null;
        if (widget.onChanged != null) {
          widget.onChanged!(null);
        }
      } else {
        value = data!;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      }
    });
  }
}
