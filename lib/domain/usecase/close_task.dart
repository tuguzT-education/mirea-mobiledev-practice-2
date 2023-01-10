import '../model/id.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class CloseTask {
  final TaskRepository _repository;

  const CloseTask(this._repository);

  Future<DomainResult<void>> closeTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: true);
    return await _repository.update(id: id, update: update);
  }
}
