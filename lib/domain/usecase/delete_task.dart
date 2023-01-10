import '../model/id.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class DeleteTask {
  final TaskRepository _repository;

  const DeleteTask(this._repository);

  Future<DomainResult<void>> deleteTask({required Id<Task> id}) async =>
      await _repository.delete(id: id);
}
