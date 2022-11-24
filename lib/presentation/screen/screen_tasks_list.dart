import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/dto/data_tech_oper.dart';
import '../../utils/horizontal_data_table.dart';

class TasksListScreen extends StatefulWidget {
  TasksListScreen(
      {Key? key, this.tasksList, this.techOperList})
      : super(key: key);

  var tasksList;
  var taskStatus;
  var techOperList;
  var name;

  @override
  _TasksListScreenState createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
  Future<dynamic?> sortName() async {
    var name = [];
    var taskStatus = [];
    for (int i = 0; i < widget.tasksList.length; i++) {
      for (int j = 0; j < widget.techOperList.length; j++) {
        if (widget.tasksList[i]['techOperId'] == widget.techOperList[j]['id'] &&
            widget.tasksList[i]['status'] == 0) {
          taskStatus.add(widget.tasksList[i]);
          name.add(widget.techOperList[j]['name']);
          setState(() {
            widget.name = name;
            widget.taskStatus = taskStatus;
          });
        }
      }
    }
    print(widget.taskStatus);
    print(widget.name);
    return widget.name;
  }

  @override
  void initState() {
    super.initState();
    sortName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новые задания'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _downloaderData(),
      ),
    );
  }

  Widget _downloaderData() {
    return Expanded(
      child: widget.taskStatus != null &&
              widget.techOperList != null &&
              widget.name != null
          ? TablePage(
              tasksList: widget.taskStatus,
              techOperList: widget.techOperList,
              name: widget.name,
            )
          : Container(
              child: const Center(
                child: Text("Please wait..."),
              ),
            ),
    );
  }
}
