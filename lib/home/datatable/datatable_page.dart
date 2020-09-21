import 'package:flutter/material.dart';
import 'package:flutter_login/home/datatable/user.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {



  List<User> data = [
    User('老孟', 18,'男',2020),
    User('老孟 1', 19,'男',2020, selected: true),
    User('老孟 2', 24,'男',2020),
    User('老孟 3', 21,'男',2020),
    User('老孟 4', 22,'男',2020),
  ];

  var _sortAscending = true;
  var _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DataRow> dateRows = [];
    for (int i = 0; i < data.length; i++) {
      dateRows.add(DataRow(
        selected: data[i].selected,
        onSelectChanged: (selected) {
          setState(() {
            data[i].selected = selected;
          });
        },
        cells: [
          DataCell(Text('${data[i].name}'),
              showEditIcon: true,
              placeholder: true,
              onTap: () => print('dataCell onTap')),
          DataCell(Text('${data[i].age}')),
          DataCell(Text('${data[i].sex}')),
          DataCell(Text('${data[i].year}')),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('表格'),
      ),
      ///当表格列比较多的时候,使用 SingleChildScrollView 包裹 DataTable，显示不全时滚动显示
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              ///sortColumnIndex 参数表示表格显示排序图标的索引，
              ///sortAscending 参数表示升序或者降序
              ///numeric设置数据右对齐
              ///tooltip长按提示
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                    label: Text('姓名'),
                    tooltip: '长按提示',
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          data.sort((a, b) => a.name.compareTo(b.name));
                        } else {
                          data.sort((a, b) => b.name.compareTo(a.name));
                        }
                      });
                    }),
                DataColumn(
                    label: Text('年龄'),
                    numeric: true,
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                        if (ascending) {
                          data.sort((a, b) => a.age.compareTo(b.age));
                        } else {
                          data.sort((a, b) => b.age.compareTo(a.age));
                        }
                      });
                    }),
                DataColumn(
                  label: Text('性别'),

                ),
                DataColumn(
                  label: Text('性别'),

                )
              ],
              rows: dateRows,
            ),
          ),
        ],
      )
    );
  }
}
