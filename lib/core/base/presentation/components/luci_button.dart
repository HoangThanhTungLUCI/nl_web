import 'package:flutter/material.dart';
import 'package:nl_web/core/common/enums/button_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciButton extends StatefulWidget {
  final String? title;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final VoidCallback? onPressed;
  final bool isDisable;
  final ButtonType type;
  final ButtonSize size;
  final Color backgroundColor;
  final Color titleColor;
  final double elevation;

  const LuciButton(
      {Key? key,
      this.title = '',
      this.leftIcon,
      this.rightIcon,
      this.size = ButtonSize.medium,
      this.onPressed,
      this.isDisable = false,
      this.type = ButtonType.primary,
      this.backgroundColor = AppColor.mCPrimary,
      this.titleColor = AppColor.mCInk900,
      this.elevation = 0.0})
      : super(key: key);

  @override
  _LuciButtonState createState() => _LuciButtonState();
}

class _LuciButtonState extends State<LuciButton> {
  bool get isEnable => widget.type != ButtonType.disabled;

  @override
  Widget build(BuildContext context) {
    double height = widget.size.toHeightButtonBySize();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
      ),
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: widget.type.backgroundColorByType(),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: isEnable ? widget.onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildLeftIcon(),
            _buildText(),
            _buildRightIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftIcon() {
    if (widget.leftIcon != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, AppDimens.mSpaceXSmall4, 0),
        child: Icon(
          widget.leftIcon,
          color: widget.type.contentColorByType(),
          size: widget.size.toIconBySize(),
        ),
      );
    }
    return SizedBox();
  }

  Widget _buildRightIcon() {
    if (widget.rightIcon != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, AppDimens.mSpaceXSmall4, 0, 0),
        child: Icon(
          widget.rightIcon,
          color: widget.type.contentColorByType(),
          size: widget.size.toIconBySize(),
        ),
      );
    }
    return SizedBox();
  }

  Widget _buildText() {
    if (widget.title != null && widget.title!.isNotEmpty) {
      return Text(
        widget.title!,
        style: widget.size.toSTButtonBySize(widget.type),
      );
    } else {
      return SizedBox();
    }
  }
}
