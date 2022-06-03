import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nl_web/core/style/style.dart';

class LuciAvatarItem {
  LuciAvatarItem({required this.imageURL, this.name});

  String imageURL;
  String? name = '';
}

class ListAvatar extends StatefulWidget {
  const ListAvatar({
    Key? key,
    this.items,
    this.backgroundColor = Colors.white,
    this.color,
    required this.size,
  }) : super(key: key);
  final List<LuciAvatarItem>? items;
  final double size;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<ListAvatar> createState() => _ListAvatarState();
}

class _ListAvatarState extends State<ListAvatar> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return newMethod(item: widget.items![index]);
    });
    return SizedBox(
      width: widget.items!.length > 4
          ? widget.size * 5
          : widget.size * int.parse('${widget.items!.length}1'),
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Stack(
          children: [
            for (var i = (widget.items!.length <= 4) ? widget.items!.length : 5;
                i > 0;
                i--)
              Positioned(
                left: (i * (1 - .2) * widget.size).toDouble(),
                top: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: widget.size / 2,
                  child: CachedNetworkImage(
                    imageUrl: widget.items![i - 1].imageURL,
                    imageBuilder: (context, imageProvider) => (i != 5)
                        ? CircleAvatar(
                            backgroundColor: AppColor.mCInk300,
                            backgroundImage: imageProvider,
                            radius: widget.size > 40
                                ? widget.size / 2 - 4
                                : widget.size / 2 - 2,
                          )
                        : CircleAvatar(
                            radius: widget.size / 2,
                            backgroundColor: AppColor.mCWhite,
                            child: CircleAvatar(
                              backgroundColor: AppColor.mCInk300,
                              child: Text(
                                "+${widget.items!.length - 4}",
                                style: AppStyles.mSTParaSmall
                                    .copyWith(color: AppColor.mCInk900)
                                    .copyWith(
                                        fontSize: widget.items!.length < 10
                                            ? AppDimens.mFontSizeSmall
                                            : 8),
                              ),
                              radius: widget.size > 40
                                  ? widget.size / 2 - 4
                                  : widget.size / 2 - 2,
                            ),
                          ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundColor: AppColor.mCPrimary100,
                      radius: widget.size / 2 - 2,
                      child: Text(
                        getNameCharacter(widget.items![i - 1].name),
                        style: AppStyles.mSTParaSmall
                            .copyWith(color: AppColor.mCInk900)
                            .copyWith(
                                fontSize: widget.items!.length < 10
                                    ? AppDimens.mFontSizeSmall
                                    : 8),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget newMethod({
    required LuciAvatarItem? item,
  }) {
    return const SizedBox();
  }

  String getNameCharacter(String? name) {
    List<String> listName = name?.split(' ') ?? [];
    String result = '';
    for (var i in listName) {
      result += i[0];
    }
    return result;
  }
}
