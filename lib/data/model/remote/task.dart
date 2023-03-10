import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiTask {
  final String id;
  final String projectId;
  final String? sectionId;
  final String content;
  final String description;
  final bool isCompleted;
  final List<String> labels;
  final String? parentId;
  final int order;
  final int priority;
  final ApiTaskDue? due;
  final String url;
  final int commentCount;
  final String createdAt;
  final String creatorId;
  final String? assigneeId;
  final String? assignerId;

  ApiTask({
    required this.id,
    required this.projectId,
    this.sectionId,
    required this.content,
    required this.description,
    required this.isCompleted,
    required this.labels,
    this.parentId,
    required this.order,
    required this.priority,
    this.due,
    required this.url,
    required this.commentCount,
    required this.createdAt,
    required this.creatorId,
    this.assigneeId,
    this.assignerId,
  });

  factory ApiTask.fromJson(Map<String, dynamic> json) =>
      _$ApiTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ApiTaskToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiTaskDue {
  final String string;
  final DateTime date;
  final bool isRecurring;
  final String lang;
  final String? datetime;
  final String? timezone;

  ApiTaskDue({
    required this.string,
    required this.date,
    required this.isRecurring,
    required this.lang,
    this.datetime,
    this.timezone,
  });

  factory ApiTaskDue.fromJson(Map<String, dynamic> json) =>
      _$ApiTaskDueFromJson(json);

  Map<String, dynamic> toJson() => _$ApiTaskDueToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCreateTask {
  final String content;
  final String description;
  final String projectId;

  ApiCreateTask({
    required this.content,
    required this.description,
    required this.projectId,
  });

  factory ApiCreateTask.fromJson(Map<String, dynamic> json) =>
      _$ApiCreateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCreateTaskToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiUpdateTask {
  final String? content;
  final String? description;
  final List<String>? labels;
  final int? priority;
  final String? dueString;
  final String? dueDate;
  final String? dueDatetime;
  final String? dueLang;
  final String? assigneeId;

  ApiUpdateTask({
    this.content,
    this.description,
    this.labels,
    this.priority,
    this.dueString,
    this.dueDate,
    this.dueDatetime,
    this.dueLang,
    this.assigneeId,
  });

  factory ApiUpdateTask.fromJson(Map<String, dynamic> json) =>
      _$ApiUpdateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUpdateTaskToJson(this);
}
