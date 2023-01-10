import '../model/id.dart';
import '../model/project.dart';
import '../repository/project.dart';
import '../result.dart';

class RefreshProjectById {
  final ProjectRepository _repository;

  const RefreshProjectById(this._repository);

  Future<DomainResult<void>> refreshProjectById({
    required Id<Project> id,
  }) async =>
      await _repository.refreshById(id: id);
}
