import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/example/company_contact_source.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_normal.dart';
import 'package:nl_web/core/base/presentation/components/luci_dropdown/luci_dropdown_only_text.dart';
import 'package:nl_web/core/common/enums/dropdown_enums.dart';
import 'package:nl_web/core/style/style.dart';

class HeaderDataTable extends StatefulWidget {
  final CompanyContactSource source;

  HeaderDataTable({required this.source});

  @override
  _HeaderDataTableState createState() => _HeaderDataTableState();
}

class _HeaderDataTableState extends State<HeaderDataTable> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 0.5, color: AppColor.mCInk300),
                  borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
                ),
                labelText: 'Search',
                hintStyle: AppStyles.mSTH300
                    .copyWith(color: Theme.of(context).hintColor),
                suffixIcon: IconButton(
                  onPressed: () =>
                      widget.source.filterServerSide(_searchController.text),
                  icon: const Icon(Icons.search),
                ),
              ),
              onSubmitted: (_) {
                widget.source.filterServerSide(_searchController.text);
              },
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _searchController.text = '';
            });
            widget.source.filterServerSide(_searchController.text);
          },
          icon: const Icon(Icons.clear),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lọc theo:'),
              SizedBox(
                width: AppDimens.mSpaceSmall,
              ),
              LuciDropdownOnlyText(
                hint: 'Option 1',
                listItem: ['option 1', 'option 2'],
                onChangedValue: (value) {},
              ),
              SizedBox(
                width: AppDimens.mSpaceSmall,
              ),
              LuciDropdownOnlyText(
                hint: 'Option 2',
                listItem: ['option 1', 'option 2'],
                onChangedValue: (value) {},
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              LuciDropdownNormal(
                hint: 'Table Action',
                listItem: ['Action 1', 'Action 2'],
                onChangedValue: (value) {},
                dropdownSize: DropdownSize.large,
                width: 138,
              ),
              SizedBox(
                width: AppDimens.mSpaceXSmall4,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.mCInk300,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(AppDimens.mRadiusNormal),
                  color: AppColor.mCInk50,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: AppDimens.mIconNormal,
                    ),
                    SizedBox(
                      width: AppDimens.mSpaceXSmall4,
                    ),
                    Text(
                      'Save View',
                      style: AppStyles.mSTH500,
                    ),
                  ],
                ),
              )
            ],
          ),
          flex: 2,
        ),
      ],
    );
  }
}
