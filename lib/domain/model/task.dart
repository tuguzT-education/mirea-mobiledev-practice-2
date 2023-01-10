import 'id.dart';
import 'node.dart';
import 'project.dart';
import 'task_due.dart';

class Task implements Node {
  @override
  final Id<Task> id;
  final String name;
  final String content;
  final bool completed;
  final TaskDue? due;
  final DateTime createdAt;

  const Task({
    required this.id,
    required this.name,
    required this.content,
    required this.completed,
    required this.due,
    required this.createdAt,
  });
}

class CreateTask {
  final Id<Project> project;
  final String name;
  final String content;

  const CreateTask({
    required this.project,
    required this.name,
    required this.content,
  });
}

class UpdateTask {
  final String? name;
  final String? content;
  final bool? completed;
  final TaskDue? due;

  const UpdateTask({this.name, this.content, this.completed, this.due});
}

extension TaskUpdates on UpdateTask {
  bool hasNoUpdates() =>
      name == null && content == null && completed == null && due == null;

  bool hasUpdates() => !hasNoUpdates();
}
