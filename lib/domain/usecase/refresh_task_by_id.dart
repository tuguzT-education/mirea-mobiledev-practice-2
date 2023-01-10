import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/task.dart';
import 'package:todolist_flutter/domain/repository/task.dart';
import 'package:todolist_flutter/domain/result.dart';

class RefreshTaskById {
  final TaskRepository repository;

  const RefreshTaskById({required this.repository});

  Future<DomainResult<void>> refreshTaskById({required Id<Task> id}) async =>
      await repository.refreshById(id: id);
}
