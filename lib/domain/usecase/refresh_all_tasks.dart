import '../model/id.dart';
import '../model/project.dart';
import '../repository/task.dart';
import '../result.dart';

class RefreshAllTasks {
  final TaskRepository _repository;

  const RefreshAllTasks(this._repository);

  Future<DomainResult<void>> refreshAllTasks({
    required Id<Project> project,
  }) async =>
      await _repository.refreshAll(project: project);
}
