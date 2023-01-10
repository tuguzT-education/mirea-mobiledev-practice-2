import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/node.dart';
import 'package:todolist_flutter/domain/model/task.dart';

class Project implements Node {
  @override
  final Id<Project> id;
  final String name;
  final dartz.IList<Task> tasks;

  const Project({required this.id, required this.name, required this.tasks});
}

class CreateProject {
  final String name;

  const CreateProject({required this.name});
}

class UpdateProject {
  final String name;

  const UpdateProject({required this.name});
}
