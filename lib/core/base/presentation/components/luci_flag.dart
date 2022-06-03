import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/flush_bar/flushbar.dart';
import 'package:nl_web/core/common/enums/flag_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciFlag {
  final String? title;
  final int? duration;
  final String? titleHeader;
  final String? message;
  final Widget? rightIcon;
  final String? positiveActionText;
  final String? negativeActionText;
  final FlagType flagType;

  late final Flushbar _flushbar;

  LuciFlag({
    this.title,
    this.duration,
    this.titleHeader,
    this.message,
    this.rightIcon,
    this.negativeActionText,
    this.positiveActionText,
    this.flagType = FlagType.normal,
  }) {
    _flushbar = Flushbar(
      titleHeader: titleHeader,
      flagType: flagType,
      icon: flagType.iconByType(),
      mainButton: rightIcon,
      flushbarPosition: FlushbarPosition.top,
      duration: Duration(seconds: duration ?? 3),
      margin: EdgeInsets.all(AppDimens.mPaddingNormal),
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8)),
      maxWidth: 380,
      backgroundColor: flagType.backgroundColorByType(),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.vertical,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
      titleColor: flagType.contentColorByType(),
      messageColor: flagType.contentColorByType(),
      negativeActionText: negativeActionText,
      positiveActionText: positiveActionText,
    );
  }

  showFlag({required BuildContext context}) {
    _flushbar.show(context);
  }
}
