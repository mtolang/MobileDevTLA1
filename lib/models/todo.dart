import 'package:flutter/material.dart';  

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

class TodoProvider with ChangeNotifier {  
  List<Todo> _todos = [];  

  List<Todo> get todos => _todos;  

  void addTodo(String title) {  
    final newTodo = Todo(  
      id: DateTime.now().toString(),  
      title: title,  
    );  
    _todos.add(newTodo);  
    notifyListeners();  
  }  

  void toggleTodoStatus(String id) {  
    final todo = _todos.firstWhere((todo) => todo.id == id);  
    todo.isDone = !todo.isDone;  
    notifyListeners();  
  }  

  void removeTodo(String id) {  
    _todos.removeWhere((todo) => todo.id == id);  
    notifyListeners();  
  }  
}  