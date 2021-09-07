import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/controller/todo_controller.dart';
import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/gateway/todo_gateway.dart';
import 'package:todo_list/interactor/todo_interactor.dart';
import 'package:todo_list/presenter/todo_presenter.dart';
import 'package:todo_list/repository/todo_repository.dart';
import 'package:todo_list/usecase/todo_usecase.dart';


final todoHandlerProvider = ChangeNotifierProvider(
  (ref) => ToDoHandler(),
);

class ToDoHandler extends ChangeNotifier {
  List<ToDo> _todo_list = [];
  List<ToDo> get todo_list => _todo_list;

  var ch = StreamController<List<ToDo>>.broadcast();

  ToDoController createController() {
    ToDoGateway tdg = ToDoRepository();
    ToDoOutputPort op = ToDoPresenter(ch);
    ToDoInputPort ip = ToDoInteractor(tdg, op);
    return ToDoController(ip);
  }

  ToDoPresenter createPresenter() {
    return ToDoPresenter(ch);
  }

  void updateState(List<ToDo> l) {
    _todo_list = l;
    print('update state');
    notifyListeners();
  }

  void deleteToDoListHandler(int index) {
    print('delete handler1');
    ToDoController c = createController();
    ToDoPresenter p = createPresenter();
    c.deleteToDoController(index);
    ch.stream.listen((tl) {
      _todo_list = tl;
      notifyListeners();
    });
  }

  void updateToDoListHandler(String title, String? memo) {
    print('update handler1');
    ToDoController c = createController();
    ToDoPresenter p = createPresenter();
    c.updateToDoController(title, memo);
    ch.stream.listen((tl) {
      _todo_list = tl;
      notifyListeners();
    });
  }

  void getToDoListHandler() {
    print('get handler1');
    ToDoController c = createController();
    ToDoPresenter p = createPresenter();
    c.getToDoController();
    ch.stream.listen((tl) {
      _todo_list = tl;
      notifyListeners();
    });
  }
}
