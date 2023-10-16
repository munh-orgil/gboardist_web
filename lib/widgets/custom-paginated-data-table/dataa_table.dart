import 'package:core_control_panel/helpers/themes/primary_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class DaataColumn {
  const DaataColumn({
    required this.label,
  });

  final Widget label;
}

@immutable
class DaataRow {
  const DaataRow({
    this.key,
    required this.cells,
  });

  final LocalKey? key;
  final List<DaataCell> cells;
}

@immutable
class DaataCell {
  const DaataCell(this.child);

  final Widget child;
}

class DaataTable extends StatelessWidget {
  DaataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.totalRow,
    required this.totalPage,
    required this.pageNumber,
    required this.maxHeight,
    required this.loading,
    this.isFilter,
    this.onPageChangeCallBack,
  }) {
    pageNumberContoller.value = TextEditingValue(text: pageNumber.toString());
  }

  final bool loading;
  final List<DaataColumn> columns;
  final List<DaataRow> rows;
  final int totalRow;
  final int totalPage;
  final int pageNumber;
  final double maxHeight;

  final bool? isFilter;

  final void Function(int pageNumber)? onPageChangeCallBack;

  final TextEditingController pageNumberContoller = TextEditingController();

  static final LocalKey _headingRowKey = UniqueKey();

  Widget _buildHeadingCell({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
    required Widget label,
    required double height,
  }) {
    label = Material(
      elevation: 1,
      child: Container(
        padding: padding,
        height: height,
        alignment: isFilter == true
            ? AlignmentDirectional.topStart
            : AlignmentDirectional.centerStart,
        child: label,
      ),
    );
    return label;
  }

  Widget _buildDataCell({
    required BuildContext context,
    required EdgeInsetsGeometry padding,
    required Widget label,
  }) {
    label = Container(
      padding: padding,
      constraints: BoxConstraints(
        minHeight: DataTableTheme.of(context).dataRowMinHeight!,
      ),
      alignment: AlignmentDirectional.centerStart,
      child: label,
    );

    return label;
  }

  pageChangeToPrev() {
    if (pageNumber - 1 < 1) return;
    onPageChangeCallBack!(pageNumber - 1);
  }

  pageChangeToNext() {
    if (pageNumber + 1 > totalPage) return;
    onPageChangeCallBack!(pageNumber + 1);
  }

  pageChangeToAny(page) {
    if (page == pageNumber) return;
    if (page > totalPage) {
      pageNumberContoller.value = TextEditingValue(text: pageNumber.toString());
      return;
    }
    onPageChangeCallBack!(page);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollControllerHorizontal = ScrollController();
    final ScrollController scrollControllerVertical = ScrollController();

    final List<TableColumnWidth> tableColumns = List<TableColumnWidth>.filled(
      columns.length + 0,
      const _NullTableColumnWidth(),
    );
    List<TableRow> tableRows = List<TableRow>.generate(
      rows.length + 1,
      (int index) {
        return TableRow(
          key: index == 0 ? _headingRowKey : rows[index - 1].key,
          children: List<Widget>.filled(
            tableColumns.length,
            const _NullWidget(),
          ),
        );
      },
    );

    List<TableRow> tableHeaders = List<TableRow>.generate(1, (int index) {
      return TableRow(
        key: index == 0 ? _headingRowKey : rows[index - 1].key,
        children: List<Widget>.filled(tableColumns.length, const _NullWidget()),
      );
    });

    int rowIndex;
    int displayColumnIndex = 0;
    double columnHeight = 0;

    if (isFilter == true) {
      columnHeight = 16 * 3.5 + 8;
    } else {
      columnHeight = 16 * 2 + 8;
    }

    for (int daataColumnIndex = 0;
        daataColumnIndex < columns.length;
        daataColumnIndex += 1) {
      final DaataColumn column = columns[daataColumnIndex];

      const EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
        start: 16 / 2,
        end: 16 / 2,
        top: 16 / 4,
        bottom: 16 / 4,
      );

      tableColumns[displayColumnIndex] = const IntrinsicColumnWidth();

      tableRows[0].children[displayColumnIndex] = _buildHeadingCell(
        context: context,
        padding: padding,
        label: column.label,
        height: columnHeight,
      );
      rowIndex = 1;
      for (final DaataRow row in rows) {
        final DaataCell cell = row.cells[daataColumnIndex];
        tableRows[rowIndex].children[displayColumnIndex] = _buildDataCell(
          context: context,
          padding: padding,
          label: cell.child,
        );
        rowIndex += 1;
      }
      displayColumnIndex += 1;
    }

    tableHeaders = [tableRows[0]];
    tableRows.removeAt(0);

    return Column(
      children: [
        totalPage == 1
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Нийт: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      totalRow.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => pageChangeToPrev(),
                      child: const Icon(Icons.chevron_left_outlined),
                    ),
                    SizedBox(
                      width: totalPage > 0
                          ? totalPage.toString().length.toDouble() * 12
                          : 36,
                      child: TextFormField(
                        controller: pageNumberContoller,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        cursorHeight: 14,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                          constraints: BoxConstraints(
                            maxHeight: 24,
                            minWidth: 36,
                          ),
                        ),
                        onFieldSubmitted: (value) => pageChangeToAny(
                          int.parse(value),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '/',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      totalPage.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap: () => pageChangeToNext(),
                      child: const Icon(
                        Icons.chevron_right_outlined,
                      ),
                    ),
                  ],
                ),
              ),
        Container(
          decoration: DataTableTheme.of(context).decoration,
          child: Material(
            type: MaterialType.transparency,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              thumbVisibility: false,
              thickness: 10,
              controller: scrollControllerHorizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollControllerHorizontal,
                child: Column(
                  children: [
                    Table(
                      columnWidths: tableColumns.asMap(),
                      children: tableHeaders,
                      border: TableBorder(
                        verticalInside: BorderSide(
                          width: 0.4,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.blueGrey.shade600
                              : PrimarySwatch.darkColor.shade600,
                        ),
                        bottom: BorderSide(
                          width: 0.4,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.blueGrey.shade600
                              : PrimarySwatch.darkColor.shade600,
                        ),
                      ),
                    ),
                    loading == false
                        ? tableRows.isNotEmpty
                            ? Container(
                                constraints: BoxConstraints(
                                  maxHeight: maxHeight,
                                ),
                                child: Scrollbar(
                                  scrollbarOrientation:
                                      ScrollbarOrientation.right,
                                  controller: scrollControllerVertical,
                                  thumbVisibility: false,
                                  thickness: 10,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    controller: scrollControllerVertical,
                                    child: Table(
                                      columnWidths: tableColumns.asMap(),
                                      children: tableRows,
                                      border: TableBorder(
                                        verticalInside: BorderSide(
                                          width: 0.4,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.blueGrey.shade600
                                              : PrimarySwatch
                                                  .darkColor.shade600,
                                        ),
                                        horizontalInside: BorderSide(
                                          width: 0.2,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.blueGrey.shade600
                                              : PrimarySwatch
                                                  .darkColor.shade600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(60),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_off_outlined,
                                      size: 24,
                                    ),
                                    const SizedBox(
                                      height: 16 / 2,
                                    ),
                                    Text(
                                      'Мэдээлэл байхгүй байна.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              )
                        : Container(
                            padding: const EdgeInsets.all(60),
                            child: const Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 16 / 2,
                                ),
                                Text('Ачааллаж байна'),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NullTableColumnWidth extends TableColumnWidth {
  const _NullTableColumnWidth();

  @override
  double maxIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) =>
      throw UnimplementedError();

  @override
  double minIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) =>
      throw UnimplementedError();
}

class _NullWidget extends Widget {
  const _NullWidget();

  @override
  Element createElement() => throw UnimplementedError();
}
