import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/flush_bar/flushbar.dart';
import 'package:nl_web/core/common/enums/section_message_enums.dart';
import 'package:nl_web/core/style/style.dart';

class LuciSectionMessage {
  final int? duration;
  final String? title;
  final String? message;
  final Widget rightIcon;
  final String? positiveActionText;
  final String? negativeActionText;
  final SectionMessageType sectionMessageType;

  late final Flushbar _flushbar;

  LuciSectionMessage({
    this.title,
    this.duration,
    this.message,
    required this.rightIcon,
    this.positiveActionText,
    this.negativeActionText,
    this.sectionMessageType = SectionMessageType.normal,
  }) {
    _flushbar = Flushbar(
      icon: sectionMessageType.iconColorByType(),
      mainButton: rightIcon,
      flushbarPosition: FlushbarPosition.top,
      duration: Duration(seconds: duration ?? 3),
      margin: EdgeInsets.all(AppDimens.mPaddingNormal),
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.mRadiusNormal8)),
      maxWidth: 580,
      backgroundColor: sectionMessageType.backgroundColorByType(),
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
      titleColor: sectionMessageType.textColorByType(),
      messageColor: sectionMessageType.textColorByType(),
      positiveActionText: positiveActionText,
      negativeActionText: negativeActionText,
    );
  }

  showSectionMessage({required BuildContext context}) {
    _flushbar.show(context);
  }
}
