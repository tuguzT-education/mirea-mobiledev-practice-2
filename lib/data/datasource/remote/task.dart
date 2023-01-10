import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart' as dio;
import 'package:todolist_flutter/data/datasource/remote/client.dart';
import 'package:todolist_flutter/data/datasource/remote/utils.dart';
import 'package:todolist_flutter/data/model/remote/task.dart';
import 'package:todolist_flutter/domain/error.dart';
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
    try {
      final response = await client.dioClient
          .get("/tasks", queryParameters: {"project_id": project.id});
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final tasks = (result.asRight() as List)
          .map((json) => ApiTask.fromJson(json))
          .map((task) => task.toDomain());
      return dartz.right(dartz.IList.from(tasks));
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Task?>> findById({required Id<Task> id}) async {
    try {
      final response = await client.dioClient.get("/tasks/$id");
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final json = result.asRight();
      final task = ApiTask.fromJson(json);
      return dartz.right(task.toDomain());
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Task>> create({required CreateTask create}) async {
    try {
      final body = ApiCreateTask(
        content: create.name,
        description: create.content,
        projectId: create.project.id,
      ).toJson();
      final response = await client.dioClient.post("/tasks", data: body);
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final json = result.asRight();
      final task = ApiTask.fromJson(json);
      return dartz.right(task.toDomain());
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Task>> update({
    required Id<Task> id,
    required UpdateTask update,
  }) async {
    try {
      if (update.completed != null) {
        if (update.completed!) {
          final response = await client.dioClient.post("/tasks/$id/close");
          final result = response.toDomainResult();
          if (result.isLeft()) {
            final error = result.asLeft();
            return dartz.left(error);
          }
        } else {
          final response = await client.dioClient.post("/tasks/$id/reopen");
          final result = response.toDomainResult();
          if (result.isLeft()) {
            final error = result.asLeft();
            return dartz.left(error);
          }
        }
      } else {
        final updateWithNoCompleted = UpdateTask(
          name: update.name,
          content: update.content,
          due: update.due,
        );
        if (updateWithNoCompleted.hasUpdates()) {
          final body = ApiUpdateTask(
            content: update.name,
            description: update.content,
            dueString: update.due?.string,
            dueDatetime: update.due?.datetime.toString(),
          ).toJson();
          final response =
              await client.dioClient.post("/tasks/$id", data: body);
          final result = response.toDomainResult();
          if (result.isLeft()) {
            final error = result.asLeft();
            return dartz.left(error);
          }
          final json = result.asRight();
          final task = ApiTask.fromJson(json);
          return dartz.right(task.toDomain());
        }
      }
      return (await findById(id: id)).map((task) => task!);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<void>> delete({required Id<Task> id}) async {
    try {
      final response = await client.dioClient.delete("/tasks/$id");
      return response.toDomainResult();
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
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
