import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/data/datasource/local/project.dart';
import 'package:todolist_flutter/data/datasource/remote/project.dart';
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final LocalProjectDataSource localDataSource;
  final RemoteProjectDataSource remoteDataSource;

  const ProjectRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<DomainResult<Project>> create({required CreateProject create}) async {
    final result = await remoteDataSource.create(create: create);
    if (result.isRight()) {
      final project = result.asRight();
      return dartz.right(project);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<void>> delete({required Id<Project> id}) async {
    final result = await remoteDataSource.delete(id: id);
    if (result.isRight()) {
      return dartz.right(null);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<Stream<Project?>>> findById({
    required Id<Project> id,
  }) async {
    final result = await remoteDataSource.findById(id: id);
    if (result.isRight()) {
      final project = result.asRight();
      final controller = StreamController<Project?>();
      controller.add(project);
      return dartz.right(controller.stream);
    } else {
      final error = result.asLeft();
      return dartz.left(error);
    }
  }

  @override
  Future<DomainResult<Stream<dartz.IList<Project>>>> getAll() async {
    final result = await remoteDataSource.getAll();
    if (result.isRight()) {
      final projects = result.asRight();
      final controller = StreamController<dartz.IList<Project>>();
      controller.add(projects);
      return dartz.right(controller.stream);
    } else {
      final error = result.asLeft();
      return dartz.left(error);
    }
  }

  @override
  Future<DomainResult<void>> refreshAll() async =>
      await remoteDataSource.getAll();

  @override
  Future<DomainResult<void>> refreshById({required Id<Project> id}) async {
    final result = await remoteDataSource.findById(id: id);
    if (result.isRight()) {
      final project = result.asRight();
      if (project == null) {
        return dartz.right(null);
      }
      return dartz.right(null);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<Project>> update({
    required Id<Project> id,
    required UpdateProject update,
  }) async {
    final result = await remoteDataSource.update(id: id, update: update);
    if (result.isRight()) {
      final project = result.asRight();
      return dartz.right(project);
    } else {
      return result;
    }
  }
}
