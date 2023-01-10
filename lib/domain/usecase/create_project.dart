import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/model/project.dart' as model;
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class CreateProject {
  final ProjectRepository repository;

  const CreateProject({required this.repository});

  Future<DomainResult<Project>> createProject({
    required model.CreateProject create,
  }) async =>
      await repository.create(create: create);
}
