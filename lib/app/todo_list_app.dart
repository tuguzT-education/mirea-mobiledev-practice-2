import 'package:flutter/material.dart';
import 'package:todolist_flutter/app/main/page.dart';

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo List",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
        ),
      ),
      home: const MainPage(),
    );
  }
}
