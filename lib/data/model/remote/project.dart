import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiProject {
  final String id;
  final String name;
  final String color;
  final String? parentId;
  final int order;
  final int commentCount;
  final bool isShared;
  final bool isFavorite;
  final bool isInboxProject;
  final bool isTeamInbox;
  final bool viewStyle;
  final String url;

  ApiProject({
    required this.id,
    required this.name,
    required this.color,
    this.parentId,
    required this.order,
    required this.commentCount,
    required this.isShared,
    required this.isFavorite,
    required this.isInboxProject,
    required this.isTeamInbox,
    required this.viewStyle,
    required this.url,
  });

  factory ApiProject.fromJson(Map<String, dynamic> json) =>
      _$ApiProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCreateProject {
  final String name;

  ApiCreateProject({required this.name});

  factory ApiCreateProject.fromJson(Map<String, dynamic> json) =>
      _$ApiCreateProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCreateProjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiUpdateProject {
  final String name;

  ApiUpdateProject({required this.name});

  factory ApiUpdateProject.fromJson(Map<String, dynamic> json) =>
      _$ApiUpdateProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ApiUpdateProjectToJson(this);
}
