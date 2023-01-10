import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class TaskById {
  final TaskRepository repository;

  const TaskById({required this.repository});

  Future<DomainResult<Stream<Task?>>> taskById({required Id<Task> id}) async =>
      await repository.findById(id: id);
}
