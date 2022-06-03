import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nl_web/core/enums/avatar_size.dart';
import 'package:nl_web/core/style/style.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    Key? key,
    this.backgroundColor = Colors.white,
    this.color,
    required this.imageURL,
    required this.icon,
    this.isTopIcon = false,
    this.size = AvatarSize.large,
    this.isBottomIcon = false,
  }) : super(key: key);
  final String imageURL;
  final Color? backgroundColor;
  final Color? color;
  final Widget icon;
  final AvatarSize size;
  final bool isTopIcon;
  final bool isBottomIcon;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.toSizeAvatarBySize(),
      width: widget.size.toSizeAvatarBySize(),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: widget.size.toSizeAvatarBySize(),
            child: CachedNetworkImage(
              imageUrl: widget.imageURL,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundColor: AppColor.mCInk300,
                  backgroundImage: imageProvider,
                  radius: widget.size.toSizeAvatarBySize()),
              errorWidget: (context, url, error) => CircleAvatar(
                backgroundColor: AppColor.mCInk100,
                child: Text(
                  'Error',
                  style: TextStyle(
                    fontFamily: mFontRoboto,
                    fontWeight: FontWeight.w400,
                    color: AppColor.mCRed500,
                    fontSize: widget.size.toSizeAvatarBySize() == AppDimens.mIconLarge
                        ? 12
                        : widget.size.toSizeAvatarBySize() == AppDimens.mIconMedium
                            ? 9
                            : widget.size.toSizeAvatarBySize() ==AppDimens.mIconNormal
                                ? 5.5
                                : 4,
                  ),
                ),
              ),
            ),
          ),
          widget.isTopIcon
              ? Positioned(
                  right: -2,
                  bottom: widget.size.toSizeAvatarBySize() == AppDimens.mIconLarge
                      ? 24
                      : widget.size.toSizeAvatarBySize() == AppDimens.mIconMedium
                          ? 17.5
                          : 11.5,
                  child: CircleAvatar(
                      backgroundColor: AppColor.mCWhite,
                      radius: widget.size.toSizeAvatarBySize() == AppDimens.mIconLarge
                          ? 9
                          : widget.size.toSizeAvatarBySize() == AppDimens.mIconMedium
                              ? 8
                              : 7,
                      child: widget.icon))
              : widget.isBottomIcon
                  ? Positioned(
                      right: -2,
                      bottom: widget.size.toSizeAvatarBySize() == AppDimens.mIconLarge
                          ? -1
                          : widget.size.toSizeAvatarBySize() == AppDimens.mIconMedium
                              ? -2
                              : -2.5,
                      child: CircleAvatar(
                          backgroundColor: AppColor.mCWhite,
                          radius: widget.size.toSizeAvatarBySize() == AppDimens.mIconLarge
                              ? 9
                              : widget.size.toSizeAvatarBySize() == AppDimens.mIconMedium
                                  ? 8
                                  : 7,
                          child: widget.icon))
                  : widget.icon
        ],
      ),
    );
  }

  double sizeAvatarBySize() {
    double result = 0;
    switch (widget.size) {
      case AvatarSize.large:
        result = AppDimens.mIconLarge;
        break;
      case AvatarSize.medium:
        result = AppDimens.mIconMedium;
        break;
      case AvatarSize.small:
        result = AppDimens.mIconNormal;
        break;
      case AvatarSize.superSmall:
        result = AppDimens.mIconSmall;
        break;
    }

    return result;
  }
}
