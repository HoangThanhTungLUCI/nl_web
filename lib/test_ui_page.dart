import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/avatar.dart';
import 'package:nl_web/core/base/presentation/components/list_avatar.dart';
import 'package:nl_web/core/base/presentation/components/luci_button.dart';
import 'package:nl_web/core/base/presentation/components/luci_checkboxes_example.dart';
import 'package:nl_web/core/base/presentation/components/luci_dialog.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_checkbox.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_normal.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_only_text.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_textfield.dart';
import 'package:nl_web/core/base/presentation/components/luci_flag.dart';
import 'package:nl_web/core/base/presentation/components/luci_radio_buttons.dart';
import 'package:nl_web/core/base/presentation/components/luci_section_message.dart';
import 'package:nl_web/core/base/presentation/components/luci_side_bar.dart';
import 'package:nl_web/core/base/presentation/components/luci_text_field.dart';
import 'package:nl_web/core/base/presentation/components/menu_item.dart';
import 'package:nl_web/core/base/presentation/components/navigation_model.dart';
import 'package:nl_web/core/base/presentation/components/navigation_one.dart';
import 'package:nl_web/core/base/presentation/components/navigation_two.dart';
import 'package:nl_web/core/base/presentation/components/luci_switch.dart';
import 'package:nl_web/core/common/enums/button_enums.dart';
import 'package:nl_web/core/common/enums/dialog_enums.dart';
import 'package:nl_web/core/common/enums/flag_enums.dart';
import 'package:nl_web/core/common/enums/section_message_enums.dart';
import 'package:nl_web/core/enums/avatar_size.dart';
import 'package:nl_web/core/enums/textfield_size.dart';
import 'package:nl_web/core/resources/images_path.dart';
import 'package:nl_web/core/style/style.dart';

class TestUIPage extends StatefulWidget {
  @override
  _TestUIPageState createState() => _TestUIPageState();
}

class _TestUIPageState extends State<TestUIPage> {
  final _drawerScrollController = ScrollController();
  List<String> listData = [
    'Một  Item1  Item1  Item1  Item1  Item1  Item1  Item1  Item1  Item1  Item1  Item1  Item1 ',
    'Hai',
    'Ba',
    'Bốn',
    'Năm',
    'Sáu',
    'Bảy',
    'Tám'
  ];
  List<String> listDataTwo = [
    'WATERPOINT',
    'WATERPOINT',
  ];
  List<String> listInfo = [
    'Standard breadcrumb',
    'Text with separator',
    'Text with separator'
  ];
  List<String> textDemo = [
    'Quản lý dự án',
    'Quản lý bộ phận cấp tập trung',
    'Quản lý nhân sự cấp tập trung',
    'Cấu hình',
  ];
  final List<String> items = [
    'Item1 Item1 Item1 Item1 Item1  Item1  Item1  Item1  Item1  Item1  Item1 ',
    'Item2',
    'Item3',
    'Item4',
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: LuciSideBar(
          sideBarController: _drawerScrollController,
          columnPadding: const EdgeInsets.only(left: 16, top: 32),
          menuItemTitle: menuItemList,
        ),
        appBar: AppBar(
            title: Text(
          'Test UI',
          style: TextStyle(color: AppColor.mCWhite),
        )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavigationOne(
                  user: User(
                      avatarUrl: ImagesPath.userDemoAvatar, name: 'HieuLQ'),
                  dataList: textDemo,
                  infoList: listInfo),
              NavigationTwo(
                  user: User(
                      avatarUrl: ImagesPath.userDemoAvatar, name: 'HieuLQ'),
                  infoList: listInfo),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LuciTextField(
                    size: TextFieldSize.medium,
                    onSubmit: (value) => print(value),
                    controller: _controller,
                    hintText: " ",
                    errorIcon: const Icon(
                      Icons.dangerous_outlined,
                      color: Colors.red,
                      size: AppDimens.mIconSmall,
                    ),
                    correctIcon: const Icon(
                      Icons.check_circle,
                      size: AppDimens.mIconSmall,
                      color: AppColor.mCGreen400,
                    ),
                    suffixIcon: const Icon(
                      Icons.info_outline_rounded,
                      color: AppColor.mCInk800,
                    ),
                    errorMessage: Text('This field is required.',
                        style: TextStyle(
                            fontSize: 12.0,
                            height: 4 / 3,
                            color: AppColor.mCRed400)),
                    correctMessage: Text('Field validation is successful.',
                        style: TextStyle(
                            fontSize: 12.0,
                            height: 4 / 3,
                            color: AppColor.mCGreen400)),
                  ),
                ],
              ),
              LuciCheckboxesExample(listData: items),
              SizedBox(
                height: 20,
              ),
              LuciSwitch(
                onChanged: (v) {},
                enable: false,
              ),
              SizedBox(
                height: 20,
              ),
              LuciButton(
                title: 'Dialog',
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return LuciDialog(
                        title: 'Modal Dialog',
                        message: 'This is place holder text. The basic dialog'
                            ' for modals should contain only valuable and '
                            'relevant information. Simplify dialogs by removing'
                            ' unnecessary elements or content that does not support '
                            'user tasks. If you find that the number of required'
                            ' elements for your design are making the dialog '
                            'excessively large, then try a different design'
                            ' solution.',
                        onPositivePressed: () => Navigator.of(context).pop(),
                        onNegativePressed: () => Navigator.of(context).pop(),
                        dialogType: DialogType.warning,
                      );
                    },
                  );
                },
                size: ButtonSize.small,
                type: ButtonType.primary,
              ),
              SizedBox(
                height: 30,
              ),
              LuciButton(
                title: 'Flag',
                onPressed: () {
                  LuciFlag(
                    title: 'Title of Flag',
                    titleHeader: 'Connecting...',
                    message:
                        'Title and actions are optional. Toggle their visibility as needed.',
                    negativeActionText: 'No thanks',
                    positiveActionText: 'Understand',
                    flagType: FlagType.warning,
                  ).showFlag(context: context);
                },
                size: ButtonSize.small,
                type: ButtonType.primary,
                leftIcon: Icons.info,
              ),
              SizedBox(
                height: 30,
              ),
              LuciButton(
                title: 'Section',
                onPressed: () {
                  LuciSectionMessage(
                      title: 'Title of Flag',
                      message:
                          'Title and actions are optional. Toggle their visibility as needed.',
                      sectionMessageType: SectionMessageType.normal,
                      negativeActionText: 'No thanks',
                      positiveActionText: 'Understand',
                      rightIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(
                          Icons.close_outlined,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )).showSectionMessage(context: context);
                },
                size: ButtonSize.small,
                type: ButtonType.primary,
              ),
              SizedBox(
                height: 30,
              ),
              // LuciDataTable(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: LuciRadioButtons<String>(
                  title: "Radio Button",
                  data: listData,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LuciDropdownNormal(
                listItem: items,
                hint: 'Action ???',
                onChangedValue: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              LuciDropdownOnlyText(
                listItem: items,
                hint: 'Action ???',
                onChangedValue: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              LuciDropdownTextField2(
                listItem: listData,
                onChangedValue: (String? value) {
                  print('$value');
                },
              ),
              SizedBox(
                height: 20,
              ),
              LuciDropdownCheckbox(
                listItem: items,
                hint: 'Action Hehe',
                onChangedValue: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ListAvatar(
                size: 24,
                backgroundColor: Colors.white,
                items: [
                  LuciAvatarItem(
                      name: 'Duy1 Doan',
                      imageURL:
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500"),
                  LuciAvatarItem(
                      name: 'Duy2 ABC',
                      imageURL:
                          "https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmwlMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                  LuciAvatarItem(
                      name: 'Duy3 ABCs',
                      imageURL:
                          "https://images.unsssplash.com/photo-1569913486515-b74bf7751574?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdpcmwlMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                  LuciAvatarItem(
                      name: 'Duy4',
                      imageURL:
                          "https://imsages.unsplash.com/photo-1440589473619-3cde28941638?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGdpcmwlMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                  LuciAvatarItem(
                      name: 'Duy3 ABCs',
                      imageURL:
                          "https://images.unsssplash.com/photo-1569913486515-b74bf7751574?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGdpcmwlMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                  LuciAvatarItem(
                      name: 'Duy4',
                      imageURL:
                          "https://imsages.unsplash.com/photo-1440589473619-3cde28941638?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGdpcmwlMjBhdmF0YXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500"),
                ],
              ),
              Avatar(
                imageURL:
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500",
                icon: Icon(
                  Icons.check_circle,
                  color: AppColor.mCGreen400,
                  size: 16,
                ),
                size: AvatarSize.large,
                isTopIcon: true,
                isBottomIcon: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
