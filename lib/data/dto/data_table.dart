import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDataTable extends StatefulWidget {
  TaskDataTable(
      {required Key key,
        required this.title,
        this.tasksList,
        required this.onPressed,
        required this.id,
        required this.empName,
        required this.techOperId,
        required this.factEndDate})
      : super(key: key);

  final String title;
  final void Function() onPressed;
  final String id;
  final String empName;
  final String techOperId;
  final String factEndDate;

  var tasksList;

  @override
  _TaskDataTableState createState() => _TaskDataTableState();
}

class _TaskDataTableState extends State<TaskDataTable> {
  // Generate a list of fiction prodcts
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'ID',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'empName',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'techOperId',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'factEndDate',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows:  <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(widget.id.toString())),
            DataCell(Text(widget.empName.toString())),
            DataCell(Text(widget.techOperId.toString())),
            DataCell(Text(widget.factEndDate.toString())),
          ],
        ),
      ],
    );
  }
}