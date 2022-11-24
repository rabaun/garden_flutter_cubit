import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/refresh/hdt_refresh_controller.dart';

class TablePage extends StatefulWidget {
  var tasksList;
  var techOperList;
  var name;

  TablePage({Key? key, this.tasksList, this.techOperList, this.name})
      : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 80,
        rightHandSideColumnWidth: 320,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.tasksList.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black38,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        // verticalScrollbarStyle: const ScrollbarStyle(
        //   thumbColor: Colors.yellow,
        //   isAlwaysShown: true,
        //   thickness: 4.0,
        //   radius: Radius.circular(5.0),
        // ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.red,
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('№ задания', 100),
      _getTitleItemWidget('Исполнитель', 110),
      _getTitleItemWidget('Техническая операция', 110),
      _getTitleItemWidget('Дата окончания', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return (widget.tasksList[index]['status'] == 0)
        ? Container(
            child: (widget.tasksList[index]['orderNumb'] != null)
                ? TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        textStyle: const TextStyle(color: Colors.black)),
                    child: Text(
                      widget.tasksList[index]['orderNumb'].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      setState(() {});
                    },
                  )
                : const Text('—'),
            width: 80,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          )
        : Container();
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return (widget.tasksList[index]['status'] == 0)
        ? Row(
            children: <Widget>[
              Container(
                child: Text(widget.tasksList[index]['empName'].toString()),
                width: 110,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                child: (widget.name != null)
                    ? Text(widget.name[index].toString())
                    : const Text('null'),
                width: 110,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                child: Text(widget.tasksList[index]['endDate'].toString()),
                width: 100,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
            ],
          )
        : Row();
  }
}
