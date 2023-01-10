import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class DeleteTask {
  final TaskRepository _repository;

  const DeleteTask(this._repository);

  Future<DomainResult<void>> deleteTask({required Id<Task> id}) async =>
      await _repository.delete(id: id);
}
