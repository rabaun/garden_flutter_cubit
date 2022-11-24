import 'package:flutter/material.dart';
import 'package:garden_cubit_new/presentation/screen/home_page_screen.dart';

import 'di.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: DI.getInstance().init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage(title: 'Выполненные задания');
          }else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
