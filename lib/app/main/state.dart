import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:uuid/uuid.dart' as uuid;

class MainState {
  final dartz.IList<Project> projects;
  final bool refreshing;
  final dartz.IList<Message> messages;

  const MainState({
    this.projects = const dartz.Nil(),
    this.refreshing = false,
    this.messages = const dartz.Nil(),
  });

  MainState copy({
    dartz.IList<Project>? projects,
    bool? refreshing,
    dartz.IList<Message>? messages,
  }) =>
      MainState(
        projects: projects ?? this.projects,
        refreshing: refreshing ?? this.refreshing,
        messages: messages ?? this.messages,
      );
}

class Message {
  final String message;
  final String id;

  Message({required this.message}) : id = _uuid.v4();

  static const _uuid = uuid.Uuid();
}
