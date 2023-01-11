import 'package:flutter/material.dart';
import 'package:todolist_flutter/domain/model/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(project.name),
      ),
    );
  }
}
