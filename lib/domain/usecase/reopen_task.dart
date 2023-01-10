import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class ReopenTask {
  final TaskRepository repository;

  const ReopenTask({required this.repository});

  Future<DomainResult<void>> reopenTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: false);
    return await repository.update(id: id, update: update);
  }
}
