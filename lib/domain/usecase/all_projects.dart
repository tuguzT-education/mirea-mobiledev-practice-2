import 'package:dartz/dartz.dart' as dartz;

import '../model/project.dart';
import '../repository/project.dart';
import '../result.dart';

class AllProjects {
  final ProjectRepository _repository;

  const AllProjects(this._repository);

  Future<DomainResult<Stream<dartz.IList<Project>>>> allProjects() async =>
      await _repository.getAll();
}
