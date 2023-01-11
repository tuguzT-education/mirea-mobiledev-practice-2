import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_flutter/app/main/event.dart';
import 'package:todolist_flutter/app/main/state.dart';
import 'package:todolist_flutter/domain/usecase/all_projects.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AllProjects allProjects;

  MainBloc({required this.allProjects}) : super(const MainState()) {
    on<GetProjectsEvent>(_getProjectsEvent);
  }

  Future<void> _getProjectsEvent(
    GetProjectsEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copy(refreshing: true));
    final result = await allProjects.allProjects();
    await result.fold(
      (error) {
        final message = Message(message: error.message ?? "Unknown error");
        final messages = state.messages.appendElement(message);
        emit(state.copy(refreshing: false, messages: messages));
      },
      (stream) async {
        emit(state.copy(refreshing: false));
        await for (final projects in stream) {
          emit(state.copy(projects: projects));
        }
      },
    );
  }
}
