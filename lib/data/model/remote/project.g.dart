// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProject _$ApiProjectFromJson(Map<String, dynamic> json) => ApiProject(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String,
      parentId: json['parent_id'] as String?,
      order: json['order'] as int,
      commentCount: json['comment_count'] as int,
      isShared: json['is_shared'] as bool,
      isFavorite: json['is_favorite'] as bool,
      isInboxProject: json['is_inbox_project'] as bool,
      isTeamInbox: json['is_team_inbox'] as bool,
      viewStyle: json['view_style'] as bool,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ApiProjectToJson(ApiProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'parent_id': instance.parentId,
      'order': instance.order,
      'comment_count': instance.commentCount,
      'is_shared': instance.isShared,
      'is_favorite': instance.isFavorite,
      'is_inbox_project': instance.isInboxProject,
      'is_team_inbox': instance.isTeamInbox,
      'view_style': instance.viewStyle,
      'url': instance.url,
    };

ApiCreateProject _$ApiCreateProjectFromJson(Map<String, dynamic> json) =>
    ApiCreateProject(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiCreateProjectToJson(ApiCreateProject instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ApiUpdateProject _$ApiUpdateProjectFromJson(Map<String, dynamic> json) =>
    ApiUpdateProject(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiUpdateProjectToJson(ApiUpdateProject instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
