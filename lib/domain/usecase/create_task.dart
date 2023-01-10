import '../model/task.dart';
import '../model/task.dart' as model;
import '../repository/task.dart';
import '../result.dart';

class CreateTask {
  final TaskRepository _repository;

  const CreateTask(this._repository);

  Future<DomainResult<Task>> createTask({
    required model.CreateTask create,
  }) async =>
      _repository.create(create: create);
}
