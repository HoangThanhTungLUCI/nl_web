import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/advanced_datatable_source.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/example/company_contact.dart';
import 'package:nl_web/core/style/style.dart';
import 'package:http/http.dart' as http;

class CompanyContactSource extends AdvancedDataTableSource<CompanyContact> {
  List<String> selectedIds = [];
  String lastSearchTerm = '';

  @override
  DataRow? getRow(int index) {
    CompanyContact companyContact = lastDetails!.rows[index];
    return DataRow(
      cells: [
        DataCell(Text(companyContact.companyName)),
        DataCell(Text(companyContact.firstName)),
        DataCell(Text(companyContact.lastName)),
        DataCell(Text(companyContact.phone)),
        DataCell(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.mRadiusSmall4)),
              shape: BoxShape.rectangle,
              color: AppColor.mCGreen400,
            ),
            child: Text(
              'Active',
              style:
                  AppStyles.mSTBaseLineNormal.copyWith(color: AppColor.mCWhite),
            ),
          ),
        ),
        DataCell(Row(
          children: [
            Ink(
              decoration: ShapeDecoration(
                color: AppColor.mCInk100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.mRadiusSmall4),
                ),
              ),
              child: IconButton(
                  onPressed: () {},
                  iconSize: AppDimens.mIconSmall,
                  padding: EdgeInsets.zero,
                  color: AppColor.mCInk100,
                  icon: const Icon(
                    Icons.visibility,
                    color: AppColor.mCInk700,
                  )),
            ),
            SizedBox(
              width: 8,
            ),
            Ink(
              decoration: ShapeDecoration(
                color: AppColor.mCBlue50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.mRadiusSmall4),
                ),
              ),
              child: IconButton(
                  iconSize: AppDimens.mIconSmall,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  color: AppColor.mCBlue50,
                  icon: const Icon(
                    Icons.edit,
                    color: AppColor.mCBlue400,
                  )),
            ),
            SizedBox(
              width: 8,
            ),
            Ink(
              decoration: ShapeDecoration(
                color: AppColor.mCRed50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.mRadiusSmall4),
                ),
              ),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: AppDimens.mIconSmall,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: AppColor.mCRed400,
                  )),
            ),
          ],
        )),
      ],
      onSelectChanged: (newState) {
        selectedRow(companyContact.id.toString(), newState ?? false);
      },
      selected: selectedIds.contains(companyContact.id.toString()),
    );
  }

  @override
  int get selectedRowCount => selectedIds.length;

  void selectedRow(String id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  Future<RemoteDataSourceDetails<CompanyContact>> getNextPage(
    NextPageRequest pageRequest,
  ) async {
    //the remote data source has to support the pagaing and sorting
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      if (lastSearchTerm.isNotEmpty) 'companyFilter': lastSearchTerm,
    };

    final requestUri = Uri.https(
      'example.devowl.de',
      '',
      queryParameter,
    );

    final response = await http.get(requestUri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return RemoteDataSourceDetails(
        int.parse(data['totalRows'].toString()),
        (data['rows'] as List<dynamic>)
            .map(
              (json) => CompanyContact.fromJson(json as Map<String, dynamic>),
            )
            .toList(),
        filteredRows: lastSearchTerm.isNotEmpty
            ? (data['rows'] as List<dynamic>).length
            : null,
      );
    } else {
      throw Exception('Unable to query remote server');
    }
  }
}
