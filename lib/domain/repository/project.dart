import 'package:dartz/dartz.dart' as dartz;

import '../model/id.dart';
import '../model/project.dart';
import '../result.dart';

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
