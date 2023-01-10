import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/data/datasource/local/task.dart';
import 'package:todolist_flutter/data/datasource/remote/task.dart';
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalTaskDataSource localDataSource;
  final RemoteTaskDataSource remoteDataSource;

  TaskRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<DomainResult<Task>> create({required CreateTask create}) async {
    final result = await remoteDataSource.create(create: create);
    if (result.isRight()) {
      final task = result.asRight();
      return await localDataSource.save(project: create.project, task: task);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<void>> delete({required Id<Task> id}) async {
    final result = await remoteDataSource.delete(id: id);
    if (result.isRight()) {
      return await localDataSource.delete(id: id);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<Stream<Task?>>> findById({required Id<Task> id}) async =>
      await localDataSource.findById(id: id);

  @override
  Future<DomainResult<Stream<dartz.IList<Task>>>> getAll({
    required Id<Project> project,
  }) async =>
      await localDataSource.getAll(project: project);

  @override
  Future<DomainResult<void>> refreshAll({required Id<Project> project}) async {
    final result = await remoteDataSource.getAll(project: project);
    if (result.isRight()) {
      final tasks = result.asRight();
      return await localDataSource.saveAll(project: project, tasks: tasks);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<void>> refreshById({required Id<Task> id}) async {
    final result = await remoteDataSource.findById(id: id);
    if (result.isRight()) {
      final task = result.asRight();
      if (task == null) {
        return dartz.right(null);
      }
      return await localDataSource.save(project: null, task: task);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<Task>> update({
    required Id<Task> id,
    required UpdateTask update,
  }) async {
    final result = await remoteDataSource.update(id: id, update: update);
    if (result.isRight()) {
      final task = result.asRight();
      return await localDataSource.save(project: null, task: task);
    } else {
      return result;
    }
  }
}
