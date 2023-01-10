import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshAllProjects {
  final ProjectRepository _repository;

  const RefreshAllProjects(this._repository);

  Future<DomainResult<void>> refreshAllProjects() async =>
      await _repository.refreshAll();
}
