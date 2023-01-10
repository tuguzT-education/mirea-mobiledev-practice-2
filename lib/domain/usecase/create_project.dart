import '../model/project.dart';
import '../model/project.dart' as model;
import '../repository/project.dart';
import '../result.dart';

class CreateProject {
  final ProjectRepository _repository;

  const CreateProject(this._repository);

  Future<DomainResult<Project>> createProject({
    required model.CreateProject create,
  }) async =>
      await _repository.create(create: create);
}
