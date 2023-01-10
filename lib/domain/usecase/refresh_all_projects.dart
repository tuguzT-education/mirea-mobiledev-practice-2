import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshAllProjects {
  final ProjectRepository repository;

  const RefreshAllProjects({required this.repository});

  Future<DomainResult<void>> refreshAllProjects() async =>
      await repository.refreshAll();
}
