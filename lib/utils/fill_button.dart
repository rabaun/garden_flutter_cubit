import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FillButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const FillButton({
     Key? key,
     required this.onPressed,
     required this.title,
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
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}