import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class DeleteTask {
  final TaskRepository repository;

  const DeleteTask({required this.repository});

  Future<DomainResult<void>> deleteTask({required Id<Task> id}) async =>
      await repository.delete(id: id);
}
