import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/result.dart';

abstract class ProjectRepository {
  Future<DomainResult<Stream<dartz.IList<Project>>>> getAll();

  Future<DomainResult<void>> refreshAll();

  Future<DomainResult<Stream<Project?>>> findById({required Id<Project> id});

  Future<DomainResult<void>> refreshById({required Id<Project> id});

  Future<DomainResult<Project>> create({required CreateProject create});

  Future<DomainResult<Project>> update({
    required Id<Project> id,
    required UpdateProject update,
  });

  Future<DomainResult<void>> delete({required Id<Project> id});
}
