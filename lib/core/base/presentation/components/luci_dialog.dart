import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_button.dart';
import 'package:nl_web/core/common/enums/button_enums.dart';
import 'package:nl_web/core/common/enums/dialog_enums.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

class LuciDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? positiveTextBtn;
  final String? negativeTextBtn;
  final VoidCallback? onPositivePressed;
  final VoidCallback? onNegativePressed;
  final bool isPopWhenPressed;
  final DialogSize dialogSize;
  final DialogType dialogType;

  LuciDialog(
      {required this.title,
      required this.message,
      this.positiveTextBtn = 'Ok',
      this.negativeTextBtn = 'Cancel',
      this.onPositivePressed,
      this.onNegativePressed,
      this.dialogSize = DialogSize.large,
      this.dialogType = DialogType.normal,
      this.isPopWhenPressed = true});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
      ),
      backgroundColor: AppColor.mCWhite,
      elevation: 2.0,
      child: Container(
        width: dialogSize.toWidthDialogBySize(),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerByType(context),
            _buildContent(),
            _buildAction(),
          ],
        ),
      ),
    );
  }

  _headerByType(BuildContext context) {
    Widget? header;
    switch (dialogType) {
      case DialogType.normal:
        header = _buildHeader(
          context,
          null,
          dialogType.toHeaderContentColor(),
          dialogType.toHeaderBackgroundColor(),
        );
        break;
      case DialogType.warning:
        header = _buildHeader(
          context,
          Icon(Icons.warning),
          dialogType.toHeaderContentColor(),
          dialogType.toHeaderBackgroundColor(),
        );
        break;

      case DialogType.danger:
        header = _buildHeader(
          context,
          Icon(Icons.cloud_circle_outlined),
          dialogType.toHeaderContentColor(),
          dialogType.toHeaderBackgroundColor(),
        );
        break;
      case DialogType.alert:
      default:
        header = SizedBox();
        break;
    }
    return header;
  }

  _buildHeader(BuildContext context, Icon? icon, Color headerContentColor,
      Color backgroundHeader) {
    return Column(
      children: [
        Container(
          height: 48.0,
          padding: EdgeInsets.symmetric(horizontal: AppDimens.mPaddingMedium),
          decoration: BoxDecoration(
            color: backgroundHeader,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.mRadiusNormal),
              topRight: Radius.circular(AppDimens.mRadiusNormal),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? SizedBox(),
              SizedBox(
                width: icon != null ? AppDimens.mSpaceXSmall : 0,
              ),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.mSTH500,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: AppDimens.mIconNormal,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: AppColor.mCInk400,
        )
      ],
    );
  }

  _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.mPaddingMedium,
        horizontal: AppDimens.mPaddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (dialogType == DialogType.alert)
            Container(
              margin: EdgeInsets.symmetric(vertical: AppDimens.mMarginSmall),
              child: Image.asset(
                ImagesPath.warning,
                width: 80,
              ),
            ),
          if (dialogType == DialogType.alert)
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimens.mMarginXSmall8,
              ),
              child: Text(
                title,
                style: AppStyles.mSTH500,
              ),
            ),
          Container(
            margin: EdgeInsets.only(
              bottom:
                  dialogType == DialogType.alert ? AppDimens.mMarginSmall : 0,
            ),
            child: Text(
              message,
              style: AppStyles.mSTParaNormal,
            ),
          ),
        ],
      ),
    );
  }

  _buildAction() {
    return Container(
      padding: EdgeInsets.all(
        AppDimens.mPaddingMedium,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.mCInk50,
        borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
      ),
      child: dialogType == DialogType.alert
          ? Center(
              child: LuciButton(
                title: negativeTextBtn,
                elevation: 0,
                size: ButtonSize.medium,
                type: ButtonType.secondary,
                onPressed: onNegativePressed,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LuciButton(
                  title: positiveTextBtn,
                  elevation: 0,
                  size: ButtonSize.medium,
                  type: ButtonType.primary,
                  onPressed: onPositivePressed,
                ),
                SizedBox(
                  width: AppDimens.mSpaceXSmall8,
                ),
                LuciButton(
                  title: negativeTextBtn,
                  elevation: 0,
                  size: ButtonSize.medium,
                  type: ButtonType.secondary,
                  onPressed: onNegativePressed,
                ),
              ],
            ),
    );
  }
}
