import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DataTableDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  /*PaginatedDataTable 一个带有分页的table*/

  int _sortColumnIndex;
  bool _sortAscending = true;

  /*数据源*/
  final DessertDataSource _dessertsDataSource = DessertDataSource();

  void _sort<T>(
      Comparable<T> getField(Dessert d), int columnIndex, bool ascending) {
    _dessertsDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  void initState() {
    super.initState();
    // 强制横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data tables'),
        ),
        body: ListView(
          children: <Widget>[
            PaginatedDataTable(
                actions: <Widget>[
                  /*跟header 在一条线的antion*/
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                ],
                header: const Text('营养'),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (int value) {
                  setState(() {
                    _rowsPerPage = value;
                  });
                },
                sortColumnIndex: _sortColumnIndex,
                /*当前主排序的列的index*/
                sortAscending: _sortAscending,
                onSelectAll: _dessertsDataSource._selectAll,
                columns: <DataColumn>[
                  DataColumn(
                      label: const Text('甜品（100克）'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Dessert d) => d.name, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('卡路里'),
                      tooltip: '给定份量的食物能量总量.',
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.calories, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('脂肪 (g)'),
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.fat, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('碳水化合物 (g)'),
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.carbs, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('蛋白质 (g)'),
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.protein, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('钠 (mg)'),
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.sodium, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('钙 (%)'),
                      tooltip: '钙含量占建议每日摄入量的百分比.',
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.calcium, columnIndex, ascending)),
                  DataColumn(
                      label: const Text('铁 (%)'),
                      numeric: true,
                      onSort: (int columnIndex, bool ascending) => _sort<num>(
                          (Dessert d) => d.iron, columnIndex, ascending)),
                ],
                source: _dessertsDataSource)
          ],
        ),
      ),
    );
  }
}

class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;

  bool selected = false;
}

class DessertDataSource extends DataTableSource {
  /*数据源*/
  static List<Dessert> _desserts = <Dessert>[
    Dessert('冰冻酸奶', 159, 6.0, 24, 4.0, 87, 14, 1),
    Dessert('冰淇淋三明治', 237, 9.0, 37, 4.3, 129, 8, 1),
    Dessert('泡芙', 262, 16.0, 24, 6.0, 337, 6, 7),
    Dessert('纸杯蛋糕', 305, 3.7, 67, 4.3, 413, 3, 8),
    Dessert('姜饼', 356, 16.0, 49, 3.9, 327, 7, 16),
    Dessert('果冻豆', 375, 0.0, 94, 0.0, 50, 0, 0),
    Dessert('棒糖', 392, 0.2, 98, 0.0, 38, 0, 2),
    Dessert('蜂窝', 408, 3.2, 87, 6.5, 562, 0, 45),
    Dessert('甜甜圈', 452, 25.0, 51, 4.9, 326, 2, 22),
    Dessert('奇巧', 518, 26.0, 65, 7.0, 54, 12, 6),
    Dessert('冷冻酸奶加糖', 168, 6.0, 26, 4.0, 87, 14, 1),
    Dessert('冰淇淋三明治加糖', 246, 9.0, 39, 4.3, 129, 8, 1),
    Dessert('用糖泡芙', 271, 16.0, 26, 6.0, 337, 6, 7),
    Dessert('加糖蛋糕', 314, 3.7, 69, 4.3, 413, 3, 8),
    Dessert('姜饼糖', 345, 16.0, 51, 3.9, 327, 7, 16),
    Dessert('果冻豆糖', 364, 0.0, 96, 0.0, 50, 0, 0),
    Dessert('棒棒糖', 401, 0.2, 100, 0.0, 38, 0, 2),
    Dessert('蜂窝糖', 417, 3.2, 89, 6.5, 562, 0, 45),
    Dessert('甜甜圈加糖', 461, 25.0, 53, 4.9, 326, 2, 22),
    Dessert('奇巧加糖', 527, 26.0, 67, 7.0, 54, 12, 6),
    Dessert('冷冻酸奶加蜂蜜', 223, 6.0, 36, 4.0, 87, 14, 1),
    Dessert('蜂蜜冰淇淋三明治', 301, 9.0, 49, 4.3, 129, 8, 1),
    Dessert('蜂蜜泡芙', 326, 16.0, 36, 6.0, 337, 6, 7),
    Dessert('蜂蜜蛋糕', 369, 3.7, 79, 4.3, 413, 3, 8),
    Dessert('蜂蜜姜饼', 420, 16.0, 61, 3.9, 327, 7, 16),
    Dessert('蜂蜜果冻豆', 439, 0.0, 106, 0.0, 50, 0, 0),
    Dessert('蜂蜜棒棒糖', 456, 0.2, 110, 0.0, 38, 0, 2),
    Dessert('蜂蜜蜂窝', 472, 3.2, 99, 6.5, 562, 0, 45),
    Dessert('甜甜圈加蜂蜜', 516, 25.0, 63, 4.9, 326, 2, 22),
    Dessert('奇巧加蜂蜜', 582, 26.0, 77, 7.0, 54, 12, 6),
    Dessert('冷冻酸奶加牛奶', 262, 8.4, 36, 12.0, 194, 44, 1),
    Dessert('冰淇淋三明治加牛奶', 339, 11.4, 49, 12.3, 236, 38, 1),
    Dessert('牛奶泡芙', 365, 18.4, 36, 14.0, 444, 36, 7),
    Dessert('牛奶蛋糕', 408, 6.1, 79, 12.3, 520, 33, 8),
    Dessert('姜饼牛奶', 459, 18.4, 61, 11.9, 434, 37, 16),
    Dessert('牛奶软糖', 478, 2.4, 106, 8.0, 157, 30, 0),
    Dessert('牛奶棒棒糖', 495, 2.6, 110, 8.0, 145, 30, 2),
    Dessert('牛奶蜂巢', 511, 5.6, 99, 14.5, 669, 30, 45),
    Dessert('牛奶甜甜圈', 555, 27.4, 63, 12.9, 433, 32, 22),
    Dessert('奇巧牛奶', 621, 28.4, 77, 15.0, 161, 42, 6),
    Dessert('椰子片冻酸奶', 318, 21.0, 31, 5.5, 96, 14, 7),
    Dessert('椰子片冰淇淋三明治', 396, 24.0, 44, 5.8, 138, 8, 7),
    Dessert('椰子片', 421, 31.0, 31, 7.5, 346, 6, 13),
    Dessert('椰子片纸杯蛋糕', 464, 18.7, 74, 5.8, 422, 3, 14),
    Dessert('椰子片姜饼', 515, 31.0, 56, 5.4, 316, 7, 22),
    Dessert('椰子片果冻豆n', 534, 15.0, 101, 1.5, 59, 0, 6),
    Dessert('椰子片棒棒糖', 551, 15.2, 105, 1.5, 47, 0, 8),
    Dessert('椰子片蜂窝', 567, 18.2, 94, 8.0, 571, 0, 51),
    Dessert('椰子片甜甜圈', 611, 40.0, 58, 6.4, 335, 2, 28),
    Dessert('奇巧椰子片', 677, 41.0, 72, 8.5, 63, 12, 12),
  ];

/*ascending 上升 这里排序 */
  void _sort<T>(Comparable<T> getField(Dessert d), bool ascending) {
    _desserts.sort((Dessert a, Dessert b) {
      if (!ascending) {
        final Dessert c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text('${dessert.name}')),
          DataCell(Text('${dessert.calories}')),
          DataCell(Text('${dessert.fat.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.carbs}')),
          DataCell(Text('${dessert.protein.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.sodium}')),
          DataCell(Text('${dessert.calcium}%')),
          DataCell(Text('${dessert.iron}%')),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _desserts.length;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (Dessert dessert in _desserts) dessert.selected = checked;
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}
