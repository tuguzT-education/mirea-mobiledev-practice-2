import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class AllTasks {
  final TaskRepository _repository;

  const AllTasks(this._repository);

  Future<DomainResult<Stream<dartz.IList<Task>>>> allTasks({
    required Id<Project> project,
  }) async =>
      await _repository.getAll(project: project);
}
