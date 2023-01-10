import 'package:dartz/dartz.dart' as dartz;

import '../model/id.dart';
import '../model/project.dart';
import '../model/task.dart';
import '../result.dart';

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
