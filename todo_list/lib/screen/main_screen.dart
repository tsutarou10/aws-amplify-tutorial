import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/handler/todo_handler.dart';


class MainScreen extends ConsumerWidget {
  final String title;

  MainScreen({Key? key, required this.title}) : super(key: key);

  ToDoHandler tdh = ToDoHandler();

  Widget _convertListView(List<ToDo> todo_list) {
    List<Widget> rsl = [];
    todo_list.forEach((ToDo todo) {
      rsl.add(
        Container(
          height: 200,
          child: Column(
            children: [
              Text(todo.title),
              Text(todo.memo ?? "null"),
            ],
          ),
        ),
      );
    });
    return ListView(
        padding: const EdgeInsets.all(8),
        children: rsl,
    );
  }

  var idx = 0;
  var isInit = true;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    if(isInit) {
      context.read(todoHandlerProvider).getToDoListHandler();
      isInit = false;
    }
    List<ToDo> todo_list = watch(todoHandlerProvider).todo_list;
    print(todo_list);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: _convertListView(todo_list),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('push');
          String title = "new todo";
          String? memo;
          if(idx % 2 == 0) {
            context.read(todoHandlerProvider).updateToDoListHandler(title, memo);
          } else {
            context.read(todoHandlerProvider).deleteToDoListHandler(0);
          }
          idx++;
        },
      ),
    );
  }
}
