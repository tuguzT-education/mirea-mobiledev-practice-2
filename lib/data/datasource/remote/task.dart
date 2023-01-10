import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/data/datasource/remote/client.dart';
import 'package:todolist_flutter/data/model/remote/task.dart';
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/model/task_due.dart';
import 'package:todolist_flutter/domain/result.dart';

class RemoteTaskDataSource {
  final ApiClient client;

  RemoteTaskDataSource({required this.client});

  Future<DomainResult<dartz.IList<Task>>> getAll({
    required Id<Project> project,
  }) async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<DomainResult<Task?>> findById({required Id<Task> id}) async {
    // TODO: implement findById
    throw UnimplementedError();
  }

  Future<DomainResult<Task>> create({required CreateTask create}) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<DomainResult<Task>> update({
    required Id<Task> id,
    required UpdateTask update,
  }) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<DomainResult<void>> delete({required Id<Task> id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}

extension ApiTaskExt on ApiTask {
  Task toDomain() => Task(
        id: Id(id: id),
        name: content,
        content: description,
        completed: isCompleted,
        due: due?.toDomain(),
        createdAt: DateTime.parse(createdAt),
      );
}

extension ApiTaskDueExt on ApiTaskDue {
  TaskDue toDomain() => TaskDue(
        string: string,
        datetime:
            (datetime != null) ? DateTime.parse(datetime!) : date.toLocal(),
      );
}
