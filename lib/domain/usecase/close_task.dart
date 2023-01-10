import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class CloseTask {
  final TaskRepository repository;

  const CloseTask({required this.repository});

  Future<DomainResult<void>> closeTask({required Id<Task> id}) async {
    const update = UpdateTask(completed: true);
    return await repository.update(id: id, update: update);
  }
}
