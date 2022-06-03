import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/menu_item.dart';
import 'package:nl_web/core/style/style.dart';

class LuciSideBar extends StatefulWidget {
  final List<MenuItemTitle> menuItemTitle;
  final Color onTapColor;
  final Color defaultColor;
  final String title;
  final ScrollController? sideBarController;
  final EdgeInsetsGeometry columnPadding;
  const LuciSideBar(
      {Key? key,
      required this.menuItemTitle,
      this.onTapColor = AppColor.mCSecondary400,
      this.defaultColor = AppColor.mCInk900,
      this.title = 'Title',
      required this.columnPadding,
      this.sideBarController})
      : super(key: key);
  @override
  _LuciSideBarState createState() => _LuciSideBarState();
}

class _LuciSideBarState extends State<LuciSideBar> {
  int _currentSelected = -1;
  int _currentSelectedList = -1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        controller: widget.sideBarController,
        padding: widget.columnPadding,
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                textAlign: TextAlign.left,
                style: AppStyles.mSTParaLarge,
              ),
              const SizedBox(
                height: AppDimens.mSpaceNormal28,
              ),
              _buildList(widget.menuItemTitle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<MenuItemTitle> menuItemTitle) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: menuItemTitle.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menuItemTitle[index].titleListTitle.toString(),
              style: AppStyles.mSTLinkSmall,
            ),
            const SizedBox(
              height: AppDimens.mSpaceXSmall,
            ),
            _buildListView(menuItemTitle, index),
            const SizedBox(
              height: AppDimens.mSpaceXSmall,
            ),
          ],
        );
      },
    );
  }

  ListView _buildListView(List<MenuItemTitle> menuItemTitle, int index) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: menuItemTitle[index].menuItem.length,
      itemBuilder: (context, index2) {
        return _buildListItems(index2, index, menuItemTitle);
      },
    );
  }

  ListTile _buildListItems(
      int index2, int index, List<MenuItemTitle> menuItemTitle) {
    return ListTile(
      shape: _currentSelected == index2
          ? _currentSelectedList == index
              ? Border(
                  left: BorderSide(width: 2.0, color: widget.onTapColor),
                )
              : null
          : null,
      leading: Icon(menuItemTitle[index].menuItem[index2].icon),
      title: Text(
        menuItemTitle[index].menuItem[index2].title.toString(),
        style:AppStyles.mSTH400.copyWith( color: _currentSelected == index2
            ? _currentSelectedList == index
            ? widget.onTapColor
            : widget.defaultColor
            : widget.defaultColor,)
      ),
      onTap: () {
        setState(
          () {
            _currentSelected = index2;
            _currentSelectedList = index;
            menuItemTitle[index].menuItem[index2].func;
          },
        );
      },
      selected: _currentSelected == index2
          ? _currentSelectedList == index
              ? true
              : false
          : false,
      selectedColor: widget.onTapColor,
    );
  }
}
