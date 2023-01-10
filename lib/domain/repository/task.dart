import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/result.dart';

abstract class TaskRepository {
  Future<DomainResult<Stream<dartz.IList<Task>>>> getAll({
    required Id<Project> project,
  });

  Future<DomainResult<void>> refreshAll({required Id<Project> project});

  Future<DomainResult<Stream<Task?>>> findById({required Id<Task> id});

  Future<DomainResult<void>> refreshById({required Id<Task> id});

  Future<DomainResult<Task>> create({required CreateTask create});

  Future<DomainResult<Task>> update({
    required Id<Task> id,
    required UpdateTask update,
  });

  Future<DomainResult<void>> delete({required Id<Task> id});
}
