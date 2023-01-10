import 'package:dartz/dartz.dart' as dartz;

import '../model/id.dart';
import '../model/project.dart';
import '../model/task.dart';
import '../repository/task.dart';
import '../result.dart';

class AllTasks {
  final TaskRepository _repository;

  const AllTasks(this._repository);

  Future<DomainResult<Stream<dartz.IList<Task>>>> allTasks({
    required Id<Project> project,
  }) async =>
      await _repository.getAll(project: project);
}
