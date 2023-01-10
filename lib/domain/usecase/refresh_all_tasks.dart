import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshAllTasks {
  final TaskRepository _repository;

  const RefreshAllTasks(this._repository);

  Future<DomainResult<void>> refreshAllTasks({
    required Id<Project> project,
  }) async =>
      await _repository.refreshAll(project: project);
}
