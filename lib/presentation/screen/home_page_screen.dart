import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden_cubit_new/presentation/screen/screen_tasks_list.dart';

import '../../utils/fill_button.dart';
import '../bloc/home_page/home_page_cubit.dart';
import '../bloc/home_page/home_page_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageCubit cubit = HomePageCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: cubit,
        builder: (context, state) {
          return state.tasks != null && state.techOper != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FillButton(
                        onPressed: () {},
                        //=> Get.to(() => IncomingTasksScreen()),
                        title: 'Новое задание',
                      ),
                    ),
                    Expanded(
                      child: FillButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TasksListScreen(
                                      tasksList: state.tasks,
                                      techOperList: state.techOper,
                                    ))),
                        title: 'Новые',
                      ),
                    ),
                    Expanded(
                      child: FillButton(
                        onPressed: () {},
                        //=> Get.to(() => IncomingTasksScreen()),
                        title: 'Передано на исполнение',
                      ),
                    ),
                    Expanded(
                      child: FillButton(
                        onPressed: () {},
                        //=> Get.to(() => IncomingTasksScreen()),
                        title: 'Выполняется',
                      ),
                    ),
                    Expanded(
                      child: FillButton(
                        onPressed: () {},
                        //=> Get.to(() => IncomingTasksScreen()),
                        title: 'На проверке',
                      ),
                    ),
                    Expanded(
                      child: FillButton(
                        onPressed: () {},
                        //=> Get.to(() => IncomingTasksScreen()),
                        title: 'Подтверждено',
                      ),
                    ),
                  ],
                )
              : Container(
                  child: const Center(
                    child: Text("Please wait..."),
                  ),
                );
        },
      )),
    );
  }
}
