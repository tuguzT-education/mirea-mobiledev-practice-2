import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class RemoteProjectDataSource {
  Future<DomainResult<dartz.IList<Project>>> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<DomainResult<Project?>> findById({required Id<Project> id}) async {
    // TODO: implement findById
    throw UnimplementedError();
  }

  Future<DomainResult<Project>> create({required CreateProject create}) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<DomainResult<Project>> update({
    required Id<Project> id,
    required UpdateProject update,
  }) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<DomainResult<void>> delete({required Id<Project> id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
