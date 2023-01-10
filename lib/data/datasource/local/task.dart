import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class LocalTaskDataSource {
  Future<DomainResult<Stream<dartz.IList<Task>>>> getAll({
    required Id<Project> project,
  }) async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<DomainResult<Stream<Task?>>> findById({
    required Id<Task> id,
  }) async {
    // TODO: implement findById
    throw UnimplementedError();
  }

  Future<DomainResult<Task>> save({
    required Id<Project>? project,
    required Task task,
  }) async {
    // TODO: implement save
    throw UnimplementedError();
  }

  Future<DomainResult<dartz.IList<Task>>> saveAll({
    required Id<Project> project,
    required dartz.IList<Task> tasks,
  }) async {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  Future<DomainResult<void>> delete({required Id<Task> id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
