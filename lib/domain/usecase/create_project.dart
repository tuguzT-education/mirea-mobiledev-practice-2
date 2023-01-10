import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/project.dart' as model;
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class CreateProject {
  final ProjectRepository _repository;

  const CreateProject(this._repository);

  Future<DomainResult<Project>> createProject({
    required model.CreateProject create,
  }) async =>
      await _repository.create(create: create);
}
