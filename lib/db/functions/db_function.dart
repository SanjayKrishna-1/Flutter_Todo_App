import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/db/models/db_model.dart';

ValueNotifier<List<TodoModel>> todoListNotifier = ValueNotifier([]);

Future<void> addTodo(TodoModel value) async {
  final todoDB = await Hive.openBox<TodoModel>('todo_db');
  final _id = await todoDB.add(value);
  value.id = _id;
  todoListNotifier.value.add(value);
  todoListNotifier.notifyListeners();
}

Future<void> getAllTodo() async {
  final todoDB = await Hive.openBox<TodoModel>('todo_db');
  todoListNotifier.value.clear();
  todoListNotifier.value.addAll(todoDB.values);
  todoListNotifier.notifyListeners();
}

Future<void> deleteTodo(int id) async {
  final todoDB = await Hive.openBox<TodoModel>('todo_db');
  await todoDB.delete(id);
  getAllTodo();
} 