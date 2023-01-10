import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshProjectById {
  final ProjectRepository repository;

  const RefreshProjectById({required this.repository});

  Future<DomainResult<void>> refreshProjectById({
    required Id<Project> id,
  }) async =>
      await repository.refreshById(id: id);
}
