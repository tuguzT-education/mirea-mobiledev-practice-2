import '../repository/project.dart';
import '../result.dart';

class RefreshAllProjects {
  final ProjectRepository _repository;

  const RefreshAllProjects(this._repository);

  Future<DomainResult<void>> refreshAllProjects() async =>
      await _repository.refreshAll();
}
