import '../model/id.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class ReopenTask {
  final TaskRepository _repository;

  const ReopenTask(this._repository);

  Future<DomainResult<void>> reopenTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: false);
    return await _repository.update(id: id, update: update);
  }
}
