import 'package:flutter/material.dart';
import 'package:to_do_app/domain/entities/todo.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  void addTodo(Todo todo) {
    todoList.add(todo);

    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todoList.removeWhere((element) => element.id == todo.id);

    notifyListeners();
  }
}
