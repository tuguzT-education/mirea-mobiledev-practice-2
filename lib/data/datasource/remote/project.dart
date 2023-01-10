import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart' as dio;
import 'package:todolist_flutter/data/datasource/remote/client.dart';
import 'package:todolist_flutter/data/datasource/remote/task.dart';
import 'package:todolist_flutter/data/datasource/remote/utils.dart';
import 'package:todolist_flutter/data/model/remote/project.dart';
import 'package:todolist_flutter/data/model/remote/task.dart';
import 'package:todolist_flutter/domain/error.dart';
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RemoteProjectDataSource {
  final ApiClient client;

  RemoteProjectDataSource({required this.client});

  Future<DomainResult<dartz.IList<Project>>> getAll() async {
    try {
      final response = await client.dioClient.get("/projects");
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final apiProjects = (result.asRight() as List)
          .map((json) => ApiProject.fromJson(json))
          .map((project) async => await toDomain(project));
      final results = await Future.wait(apiProjects);
      if (results.every((element) => element.isRight())) {
        final projects = dartz.IList.from(results.map((e) => e.asRight()));
        return dartz.right(projects);
      }
      final error = results.firstWhere((element) => element.isLeft()).asLeft();
      return dartz.left(error);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Project?>> findById({required Id<Project> id}) async {
    try {
      final response = await client.dioClient.get("/projects/$id");
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final json = result.asRight();
      final project = ApiProject.fromJson(json);
      return toDomain(project);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Project>> create({required CreateProject create}) async {
    try {
      final body = ApiCreateProject(name: create.name).toJson();
      final response = await client.dioClient.post("/projects", data: body);
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final json = result.asRight();
      final project = ApiProject.fromJson(json);
      return toDomain(project);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Project>> update({
    required Id<Project> id,
    required UpdateProject update,
  }) async {
    try {
      final body = ApiUpdateProject(name: update.name).toJson();
      final response = await client.dioClient.post("/projects/$id", data: body);
      final result = response.toDomainResult();
      if (result.isLeft()) {
        final error = result.asLeft();
        return dartz.left(error);
      }
      final json = result.asRight();
      final project = ApiProject.fromJson(json);
      return toDomain(project);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<void>> delete({required Id<Project> id}) async {
    try {
      final response = await client.dioClient.delete("/projects/$id");
      return response.toDomainResult();
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }

  Future<DomainResult<Project>> toDomain(ApiProject project) async {
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
      final domain = Project(
        id: Id(id: project.id),
        name: project.name,
        tasks: dartz.IList.from(tasks),
      );
      return dartz.right(domain);
    } on dio.DioError catch (e) {
      return dartz.left(e.toDomainError());
    } catch (e) {
      return dartz.left(UnknownError(message: "$e"));
    }
  }
}
