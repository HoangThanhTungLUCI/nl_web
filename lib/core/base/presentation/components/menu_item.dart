import 'package:flutter/material.dart';

class MenuItem {
  String? title;
  IconData? icon;
  Color? color;
  Function? func;
  MenuItem(this.title, this.icon, this.color, this.func);
}

class MenuItemTitle {
  List<MenuItem> menuItem = [];
  String? titleListTitle;
  MenuItemTitle({required this.menuItem, required this.titleListTitle});
}

final List<MenuItem> menuItem = [
  MenuItem(
      "titlesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssstitlessssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss",
      Icons.info_outline_rounded,
      Colors.blue,
      null),
  MenuItem("title", Icons.info_outline_rounded, Colors.red, null),
  MenuItem("title", Icons.info_outline_rounded, Colors.green, null),
  MenuItem("title", Icons.info_outline_rounded, Colors.yellow, null),
  MenuItem("title", Icons.info_outline_rounded, Colors.orange, null),
];
final List<MenuItemTitle> menuItemList = [
  MenuItemTitle(menuItem: menuItem, titleListTitle: 'Title'),
  MenuItemTitle(menuItem: menuItem, titleListTitle: 'Title2'),
  MenuItemTitle(menuItem: menuItem, titleListTitle: 'Title3'),
  MenuItemTitle(menuItem: menuItem, titleListTitle: 'Title4'),
];
