import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshTaskById {
  final TaskRepository _repository;

  const RefreshTaskById(this._repository);

  Future<DomainResult<void>> refreshTaskById({required Id<Task> id}) async =>
      await _repository.refreshById(id: id);
}
