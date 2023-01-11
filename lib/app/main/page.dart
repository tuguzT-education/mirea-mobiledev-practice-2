import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todolist_flutter/app/main/bloc.dart';
import 'package:todolist_flutter/app/main/event.dart';
import 'package:todolist_flutter/app/main/state.dart';
import 'package:todolist_flutter/app/project_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<MainBloc>()..add(GetProjectsEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text("ToDo List")),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) => {},
          builder: (context, state) => ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => ProjectCard(
              project: state.projects.toIterable().elementAt(index),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: state.projects.length(),
          ),
        ),
      ),
    );
  }
}
