
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final counterCases = DI.getInstance().counterCase;

  HomePageCubit() : super(HomePageState(tasks: [], techOper: [])) {
    getNewTasks();
  }

  Future<void> getNewTasks() async {
    final tasksList = await counterCases.getNewTasks();
    final techOperList = await counterCases.getTechOper();

    emit(HomePageState(tasks: tasksList, techOper: techOperList));
  }
}
