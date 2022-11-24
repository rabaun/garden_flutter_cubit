import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {
  final void Function() onPressed;
  final String id;
  final String empName;
  final String techOperId;
  final String factEndDate;

  const TaskButton({
    Key? key,
    required this.onPressed,
    required this.id, required this.empName, required this.techOperId, required this.factEndDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.resolveWith((_) => Colors.grey.shade300),
          foregroundColor:
          MaterialStateProperty.resolveWith((_) => Colors.black),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Text(id, style: const TextStyle(fontSize: 12)),
            Text(empName, style: const TextStyle(fontSize: 12)),
            Text(techOperId, style: const TextStyle(fontSize: 12)),
            Text(factEndDate, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}