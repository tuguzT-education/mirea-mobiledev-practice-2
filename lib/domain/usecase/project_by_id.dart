import '../model/id.dart';
import '../model/project.dart';
import '../repository/project.dart';
import '../result.dart';

class ProjectById {
  final ProjectRepository _repository;

  const ProjectById(this._repository);

  Future<DomainResult<Stream<Project?>>> projectById({
    required Id<Project> id,
  }) async =>
      await _repository.findById(id: id);
}
