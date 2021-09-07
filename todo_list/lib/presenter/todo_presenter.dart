import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/handler/todo_handler.dart';
import 'package:todo_list/usecase/todo_usecase.dart';

class ToDoPresenter implements ToDoOutputPort {
  var ch ;
  ToDoPresenter(this.ch);

  void emitDeleteToDoList(List<ToDo> l) async{
    print('presenter');
    await Future.delayed(Duration(seconds: 1));
    print('emitDelete');
    ch.sink.add(l);
  }

  void emitUpdateToDoList(List<ToDo> l) async{
    print('presenter');
    await Future.delayed(Duration(seconds: 1));
    print('emitUpdate');
    ch.sink.add(l);
  }

  void emitGetToDoList(List<ToDo> l) async {
    await Future.delayed(Duration(seconds: 1));
    print('emitDelete');
    ch.sink.add(l);
  }
}
