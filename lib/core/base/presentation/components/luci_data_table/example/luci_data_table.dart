import 'package:flutter/material.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/example/company_contact_source.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/datatable.dart';
import 'package:nl_web/core/base/presentation/components/luci_data_table/example/header_datatable.dart';

class LuciDataTable extends StatefulWidget {
  @override
  _LuciDataTableState createState() => _LuciDataTableState();
}

class _LuciDataTableState extends State<LuciDataTable> {
  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final _source = CompanyContactSource();
  var _sortIndex = 0;
  var _sortAsc = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderDataTable(
          source: _source,
        ),
        AdvancedPaginatedDataTable(
          addEmptyRows: false,
          showFirstLastButtons: true,
          source: _source,
          sortAscending: _sortAsc,
          sortColumnIndex: _sortIndex,
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: const [5, 10, 15, 20],
          onRowsPerPageChanged: (newRowsPerPage) {
            if (newRowsPerPage != null) {
              setState(() {
                _rowsPerPage = newRowsPerPage;
              });
            }
          },
          columns: [
            DataColumn(
              label: const Text('Company'),
              onSort: setSort,
            ),
            DataColumn(
              label: const Text('First name'),
              onSort: setSort,
            ),
            DataColumn(
              label: const Text('Last name'),
              onSort: setSort,
            ),
            DataColumn(
              label: const Text('Phone'),
              onSort: setSort,
            ),
            DataColumn(
              label: const Text('Account State'),
              onSort: setSort,
            ),
            DataColumn(
              label: const Text('Action'),
              onSort: setSort,
            ),
          ],

          //Optional override to support custom data row text / translation
          getFooterRowText:
              (startRow, pageSize, totalFilter, totalRowsWithoutFilter) {
            final localizations = MaterialLocalizations.of(context);
            var amountText = localizations.pageRowsInfoTitle(
              startRow,
              pageSize,
              totalFilter ?? totalRowsWithoutFilter,
              false,
            );

            if (totalFilter != null) {
              //Filtered data source show additional information
              amountText += ' filtered from ($totalRowsWithoutFilter)';
            }

            return amountText;
          },
        ),
      ],
    );
  }

  void setSort(int i, bool asc) => setState(() {
        _sortIndex = i;
        _sortAsc = asc;
      });
}
