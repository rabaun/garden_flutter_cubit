
import '../api_service.dart';
import '../interface/counter_repo.dart';

class CounterRepositoryImpl extends CounterRepository {
  @override
  Future<String?> getToken() async {
    var _apiService = ApiService();

    String? token;
    try {
      token = await _apiService.getToken();
      print(token.toString());
    } catch (e) {}
    return token.toString();
  }

  @override
  Future<dynamic?> getNewTasks() async {
    var _apiService = ApiService();

    var tasksList;
    try {
      var token = await getToken();
      if (token != null) {
        tasksList = await _apiService.getNewTasks(token);
        print(tasksList);
      }
    } catch (e) {}
    print(tasksList);
    return tasksList;
  }

  @override
  Future<dynamic?> getTechOper() async {
    var _apiService = ApiService();

    var techOperList;
    try {
      var token = await getToken();
      if (token != null){
        techOperList = await _apiService.getTechOper(token);
        print(techOperList);
      }
    } catch (e) {}
    print(techOperList);
    return techOperList;
  }
}
