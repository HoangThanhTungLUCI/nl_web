import 'package:flutter/material.dart';
import 'package:nl_web/core/common/enums/switch_enums.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

// ignore: must_be_immutable
class LuciSwitch extends StatefulWidget {
  bool open;
  ValueChanged<bool> onChanged;
  SwitchSize size;
  double? offset;
  Widget? openChild;
  Widget? closeChild;
  double? childOffset;
  Color? color;
  Color? openColor;
  Color? sliderColor;
  Widget? sliderChild;
  bool enable;
  Color? shadowColor;
  Offset? shadowOffset;
  double shadowBlur;

  LuciSwitch({
    Key? key,
    required this.onChanged,
    this.open = false,
    this.offset,
    this.size = SwitchSize.medium,
    this.childOffset,
    this.closeChild,
    this.openChild,
    this.color,
    this.openColor,
    this.sliderColor,
    this.sliderChild,
    this.enable = true,
    this.shadowColor,
    this.shadowOffset,
    this.shadowBlur = 0.0,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FSwitch();
  }
}

class _FSwitch extends State<LuciSwitch> {
  late double fixOffset;
  bool dragging = false;
  double dragDxW = 10.0;

  late double width;
  late double height;

  @override
  void initState() {
    super.initState();

    widget.closeChild ??= ImageIcon(
      AssetImage(
        ImagesPath.cross,
      ),
      size: AppDimens.mIconSmall,
      color: AppColor.mCWhite,
    );

    widget.openChild ??= ImageIcon(
      AssetImage(
        ImagesPath.check,
      ),
      size: AppDimens.mIconSmall,
      color: AppColor.mCWhite,
    );

    width = widget.size.getDimensionSwitch();
    height = widget.size.getDimensionSwitch() / 2;
    fixOffset = widget.open
        ? width -
            (widget.offset ?? 2.0 / 36.0 * ((height))) * 2.0 -
            (height) * (32.52 / 36.0)
        : 0;
  }

  @override
  void didUpdateWidget(LuciSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    fixOffset = widget.open
        ? width -
            (widget.offset ?? 2.0 / 36.0 * ((height))) * 2.0 -
            (height) * (32.52 / 36.0)
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = (height * (32.52 / 40.0));
    widget.offset = widget.offset ?? 2.0 / 40.0 * height;
    double childOffset = widget.childOffset ?? height / 5.0;
    widget.color = widget.color ?? AppColor.mCInk700;
    widget.openColor = widget.openColor ?? AppColor.mCGreen400;

    List<Widget> children = [];

    var showShadow = widget.shadowColor != null && widget.shadowBlur != 0;
    var background = AnimatedContainer(
      duration: Duration(milliseconds: 350),
      decoration: BoxDecoration(
        color: widget.enable
            ? (widget.open ? widget.openColor : widget.color) ?? widget.color
            : AppColor.mCInk200,
        borderRadius: BorderRadius.all(Radius.circular(height / 2.0)),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: widget.shadowColor!,
                  offset: widget.shadowOffset ?? Offset(0, 0),
                  blurRadius: widget.shadowBlur,
                )
              ]
            : null,
      ),
      child: Container(
        width: width,
        height: height,
      ),
    );
    children.add(background);

    var showChild = widget.open ? widget.openChild : widget.closeChild;
    if (showChild != null) {
      showChild = Positioned(
        left: widget.open ? childOffset : null,
        right: widget.open ? null : childOffset,
        child: showChild,
      );
      children.add(showChild);
    }

    var slider = AnimatedContainer(
      margin: EdgeInsets.fromLTRB(widget.offset! + fixOffset + 1, 0, 0, 0),
      duration: Duration(milliseconds: 200),
      width: circleSize + (dragging ? dragDxW : 0.0),
      child: Container(
        height: circleSize,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.enable
                ? widget.sliderColor ?? AppColor.mCWhite
                : AppColor.mCInk500,
            borderRadius: BorderRadius.all(Radius.circular(circleSize / 2.0))),
        child: widget.sliderChild,
      ),
    );
    children.add(slider);

    if (!widget.enable) {
      var disableMask = Opacity(
        opacity: 0.6,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: AppColor.mCWhite,
              borderRadius: BorderRadius.all(Radius.circular(height / 2.0))),
        ),
      );
      children.add(disableMask);
    }

    return GestureDetector(
      onTap: widget.enable ? _handleOnTap : null,
      onHorizontalDragEnd: widget.enable ? _handleOnHorizontalDragEnd : null,
      onHorizontalDragUpdate:
          widget.enable ? _handleOnHorizontalDragUpdate : null,
      onHorizontalDragCancel: widget.enable ? _handleDragCancel : null,
      onHorizontalDragStart: widget.enable ? _handleDragStart : null,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: children,
      ),
    );
  }

  void _handleOnTap() {
    setState(() {
      widget.open = !widget.open;
      double circleSize = (height * (32.52 / 36.0));
      if (widget.open) {
        fixOffset = width - widget.offset! - circleSize - widget.offset!;
      } else {
        fixOffset = 0;
      }
      widget.onChanged(widget.open);
    });
  }

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      dragging = true;
    });
  }

  void _handleOnHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      double circleSize = (height * (32.52 / 36.0));
      fixOffset = fixOffset + details.delta.dx;
      if (fixOffset < 0) {
        fixOffset = 0;
      } else if (fixOffset >
          width -
              widget.offset! -
              circleSize -
              (dragging ? dragDxW : 0.0) -
              widget.offset!) {
        fixOffset = width -
            widget.offset! -
            circleSize -
            (dragging ? dragDxW : 0.0) -
            widget.offset!;
      }
    });
  }

  void _handleOnHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      dragging = false;
      // double height = height ?? width * 0.608;
      double circleSize = (height * (32.52 / 36.0));
      double center = (width -
              widget.offset! -
              circleSize -
              (dragging ? dragDxW : 0.0) -
              widget.offset!) /
          2;
      bool cacheValue = widget.open;
      if (fixOffset < center) {
        fixOffset = 0;
        widget.open = false;
      } else {
        fixOffset = center * 2;
        widget.open = true;
      }
      if (cacheValue != widget.open) {
        widget.onChanged(widget.open);
      }
    });
  }

  void _handleDragCancel() {
    setState(() {
      dragging = false;
    });
  }
}
