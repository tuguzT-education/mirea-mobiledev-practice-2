import '../model/id.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class RefreshTaskById {
  final TaskRepository _repository;

  const RefreshTaskById(this._repository);

  Future<DomainResult<void>> refreshTaskById({required Id<Task> id}) async =>
      await _repository.refreshById(id: id);
}
