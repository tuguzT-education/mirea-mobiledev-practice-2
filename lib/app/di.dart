import 'package:get_it/get_it.dart';
import 'package:todolist_flutter/app/main/bloc.dart';
import 'package:todolist_flutter/data/datasource/local/project.dart';
import 'package:todolist_flutter/data/datasource/remote/client.dart';
import 'package:todolist_flutter/data/datasource/remote/project.dart';
import 'package:todolist_flutter/data/repository/project.dart';
import 'package:todolist_flutter/domain/repository/project.dart';
import 'package:todolist_flutter/domain/usecase/all_projects.dart';

void init() {
  GetIt.instance.registerSingleton(ApiClient());

  GetIt.instance.registerFactory(
      () => RemoteProjectDataSource(client: GetIt.instance<ApiClient>()));
  GetIt.instance.registerFactory(() => LocalProjectDataSource());
  GetIt.instance.registerFactory<ProjectRepository>(() => ProjectRepositoryImpl(
        localDataSource: GetIt.instance<LocalProjectDataSource>(),
        remoteDataSource: GetIt.instance<RemoteProjectDataSource>(),
      ));
  GetIt.instance.registerFactory(
      () => AllProjects(repository: GetIt.instance<ProjectRepository>()));
  GetIt.instance.registerFactory(
      () => MainBloc(allProjects: GetIt.instance<AllProjects>()));
}
