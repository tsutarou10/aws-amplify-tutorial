import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/gateway/todo_gateway.dart';

class ToDoRepository implements ToDoGateway {
  List<ToDo> _todoList = [
    ToDo("todo1"),
    ToDo("todo2", "memo2"),
    ToDo("todo3"),
  ];

  List<ToDo> getToDoList() {
    return _todoList;
  }

  List<ToDo> updateToDoList(String title, String? memo) {
    List<ToDo> todo_list = _todoList;
    todo_list.add(
      ToDo(title, memo)
    );
    return todo_list;
  }

  List<ToDo> deleteToDoList(int index) {
    print('repository');
    _todoList.removeAt(index);
    return _todoList;
  }
}

