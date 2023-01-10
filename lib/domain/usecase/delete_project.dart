import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class DeleteProject {
  final ProjectRepository _repository;

  const DeleteProject(this._repository);

  Future<DomainResult<void>> deleteProject({required Id<Project> id}) async =>
      await _repository.delete(id: id);
}
