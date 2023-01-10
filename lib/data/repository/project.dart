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
      return await localDataSource.save(project: project);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<void>> delete({required Id<Project> id}) async {
    final result = await remoteDataSource.delete(id: id);
    if (result.isRight()) {
      return await localDataSource.delete(id: id);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<Stream<Project?>>> findById({
    required Id<Project> id,
  }) async =>
      await localDataSource.findById(id: id);

  @override
  Future<DomainResult<Stream<dartz.IList<Project>>>> getAll() async =>
      await localDataSource.getAll();

  @override
  Future<DomainResult<void>> refreshAll() async {
    final result = await remoteDataSource.getAll();
    if (result.isRight()) {
      final projects = result.asRight();
      return await localDataSource.saveAll(projects: projects);
    } else {
      return result;
    }
  }

  @override
  Future<DomainResult<void>> refreshById({required Id<Project> id}) async {
    final result = await remoteDataSource.findById(id: id);
    if (result.isRight()) {
      final project = result.asRight();
      if (project == null) {
        return dartz.right(null);
      }
      return await localDataSource.save(project: project);
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
      return await localDataSource.save(project: project);
    } else {
      return result;
    }
  }
}
