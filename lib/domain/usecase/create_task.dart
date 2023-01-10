import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/model/task.dart' as model;
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class CreateTask {
  final TaskRepository _repository;

  const CreateTask(this._repository);

  Future<DomainResult<Task>> createTask({
    required model.CreateTask create,
  }) async =>
      _repository.create(create: create);
}
