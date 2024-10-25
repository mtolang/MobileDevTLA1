import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String id;
  final String title;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    this.isDone = false,
  });
}

class TodoNotifier extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    _todos.add(newTodo);
    notifyListeners(); // Notify listeners after modifying the list
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      _todos[todoIndex].isDone = !_todos[todoIndex].isDone;
      notifyListeners(); // Notify listeners of the change
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners(); // Notify listeners after removal
  }
}

// Provider to manage the state of the Todo list using ChangeNotifierProvider
final todoProvider = ChangeNotifierProvider<TodoNotifier>((ref) {
  return TodoNotifier();
});
