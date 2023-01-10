import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/model/id.dart';
import 'package:todolist_flutter/domain/model/project.dart';
import 'package:todolist_flutter/domain/result.dart';

class LocalProjectDataSource {
  Future<DomainResult<Stream<dartz.IList<Project>>>> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<DomainResult<Stream<Project?>>> findById({
    required Id<Project> id,
  }) async {
    // TODO: implement findById
    throw UnimplementedError();
  }

  Future<DomainResult<Project>> save({required Project project}) async {
    // TODO: implement save
    throw UnimplementedError();
  }

  Future<DomainResult<dartz.IList<Project>>> saveAll({
    required dartz.IList<Project> projects,
  }) async {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  Future<DomainResult<void>> delete({required Id<Project> id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
