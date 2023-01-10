import 'package:todolist_flutter/domain/model/id.dart';

abstract class Node {
  final Id<Node> id;

  const Node({required this.id});
}
