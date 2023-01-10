import '../model/id.dart';
import '../model/project.dart';
import '../repository/project.dart';
import '../result.dart';

class DeleteProject {
  final ProjectRepository _repository;

  const DeleteProject(this._repository);

  Future<DomainResult<void>> deleteProject({required Id<Project> id}) async =>
      await _repository.delete(id: id);
}
