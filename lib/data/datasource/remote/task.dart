import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class RemoteTaskDataSource {
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
