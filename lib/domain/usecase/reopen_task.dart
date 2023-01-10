import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class ReopenTask {
  final TaskRepository _repository;

  const ReopenTask(this._repository);

  Future<DomainResult<void>> reopenTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: false);
    return await _repository.update(id: id, update: update);
  }
}
