import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshProjectById {
  final ProjectRepository _repository;

  const RefreshProjectById(this._repository);

  Future<DomainResult<void>> refreshProjectById({
    required Id<Project> id,
  }) async =>
      await _repository.refreshById(id: id);
}
