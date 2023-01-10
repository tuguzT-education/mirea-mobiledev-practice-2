// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiTask _$ApiTaskFromJson(Map<String, dynamic> json) => ApiTask(
      id: json['id'] as String,
      projectId: json['project_id'] as String,
      sectionId: json['section_id'] as String?,
      content: json['content'] as String,
      description: json['description'] as String,
      isCompleted: json['is_completed'] as bool,
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      parentId: json['parent_id'] as String?,
      order: json['order'] as int,
      priority: json['priority'] as int,
      due: json['due'] == null
          ? null
          : ApiTaskDue.fromJson(json['due'] as Map<String, dynamic>),
      url: json['url'] as String,
      commentCount: json['comment_count'] as int,
      createdAt: json['created_at'] as String,
      creatorId: json['creator_id'] as String,
      assigneeId: json['assignee_id'] as String?,
      assignerId: json['assigner_id'] as String?,
    );

Map<String, dynamic> _$ApiTaskToJson(ApiTask instance) => <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'section_id': instance.sectionId,
      'content': instance.content,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'labels': instance.labels,
      'parent_id': instance.parentId,
      'order': instance.order,
      'priority': instance.priority,
      'due': instance.due,
      'url': instance.url,
      'comment_count': instance.commentCount,
      'created_at': instance.createdAt,
      'creator_id': instance.creatorId,
      'assignee_id': instance.assigneeId,
      'assigner_id': instance.assignerId,
    };

ApiTaskDue _$ApiTaskDueFromJson(Map<String, dynamic> json) => ApiTaskDue(
      string: json['string'] as String,
      date: DateTime.parse(json['date'] as String),
      isRecurring: json['is_recurring'] as bool,
      lang: json['lang'] as String,
      datetime: json['datetime'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$ApiTaskDueToJson(ApiTaskDue instance) =>
    <String, dynamic>{
      'string': instance.string,
      'date': instance.date.toIso8601String(),
      'is_recurring': instance.isRecurring,
      'lang': instance.lang,
      'datetime': instance.datetime,
      'timezone': instance.timezone,
    };

ApiCreateTask _$ApiCreateTaskFromJson(Map<String, dynamic> json) =>
    ApiCreateTask(
      content: json['content'] as String,
      description: json['description'] as String,
      projectId: json['project_id'] as String,
    );

Map<String, dynamic> _$ApiCreateTaskToJson(ApiCreateTask instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
      'project_id': instance.projectId,
    };

ApiUpdateTask _$ApiUpdateTaskFromJson(Map<String, dynamic> json) =>
    ApiUpdateTask(
      content: json['content'] as String?,
      description: json['description'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      priority: json['priority'] as int?,
      dueString: json['due_string'] as String?,
      dueDate: json['due_date'] as String?,
      dueDatetime: json['due_datetime'] as String?,
      dueLang: json['due_lang'] as String?,
      assigneeId: json['assignee_id'] as String?,
    );

Map<String, dynamic> _$ApiUpdateTaskToJson(ApiUpdateTask instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
      'labels': instance.labels,
      'priority': instance.priority,
      'due_string': instance.dueString,
      'due_date': instance.dueDate,
      'due_datetime': instance.dueDatetime,
      'due_lang': instance.dueLang,
      'assignee_id': instance.assigneeId,
    };
