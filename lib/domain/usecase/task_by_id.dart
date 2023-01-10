import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class TaskById {
  final TaskRepository _repository;

  const TaskById(this._repository);

  Future<DomainResult<Stream<Task?>>> taskById({required Id<Task> id}) async =>
      await _repository.findById(id: id);
}
