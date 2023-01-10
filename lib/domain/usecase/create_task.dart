import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/model/task.dart' as model;
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class CreateTask {
  final TaskRepository repository;

  const CreateTask({required this.repository});

  Future<DomainResult<Task>> createTask({
    required model.CreateTask create,
  }) async =>
      repository.create(create: create);
}
