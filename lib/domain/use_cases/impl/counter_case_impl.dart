
import '../../../data/repository/interface/counter_repo.dart';
import '../interfaces/counter_case.dart';

class CounterCaseImpl extends CounterCase {
  final CounterRepository _counterRepository;

  CounterCaseImpl(this._counterRepository);

  @override
  Future<String?> getToken() => _counterRepository.getToken();

  @override
  Future<dynamic?> getNewTasks() => _counterRepository.getNewTasks();

  Future<dynamic?> getTechOper() => _counterRepository.getTechOper();
}
