import '../model/id.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class TaskById {
  final TaskRepository _repository;

  const TaskById(this._repository);

  Future<DomainResult<Stream<Task?>>> taskById({required Id<Task> id}) async =>
      await _repository.findById(id: id);
}
