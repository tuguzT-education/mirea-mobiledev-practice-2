class TaskDue {
  final String string;
  final DateTime datetime;

  const TaskDue({required this.string, required this.datetime});
}

class UpdateTaskDue {
  final String? string;
  final DateTime? datetime;

  const UpdateTaskDue({this.string, this.datetime});
}

extension TaskDueUpdates on UpdateTaskDue {
  bool hasNoUpdates() => string == null && datetime == null;

  bool hasUpdates() => !hasNoUpdates();
}
