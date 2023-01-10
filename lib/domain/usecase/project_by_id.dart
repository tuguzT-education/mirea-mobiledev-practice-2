import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class ProjectById {
  final ProjectRepository _repository;

  const ProjectById(this._repository);

  Future<DomainResult<Stream<Project?>>> projectById({
    required Id<Project> id,
  }) async =>
      await _repository.findById(id: id);
}
