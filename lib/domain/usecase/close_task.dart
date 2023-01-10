import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class CloseTask {
  final TaskRepository _repository;

  const CloseTask(this._repository);

  Future<DomainResult<void>> closeTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: true);
    return await _repository.update(id: id, update: update);
  }
}
