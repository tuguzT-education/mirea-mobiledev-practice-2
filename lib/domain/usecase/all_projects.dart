import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class AllProjects {
  final ProjectRepository repository;

  const AllProjects({required this.repository});

  Future<DomainResult<Stream<dartz.IList<Project>>>> allProjects() async =>
      await repository.getAll();
}
