import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class AllProjects {
  final ProjectRepository _repository;

  const AllProjects(this._repository);

  Future<DomainResult<Stream<dartz.IList<Project>>>> allProjects() async =>
      await _repository.getAll();
}
