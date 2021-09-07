import 'package:todo_list/entity/todo_entity.dart';

abstract class ToDoInputPort {
  void handleDeleteToDo(int index);
  void handleUpdateToDo(String title, String? memo);
  void handleGetToDo();
}

abstract class ToDoOutputPort {
  void emitDeleteToDoList(List<ToDo> todo_list);
  void emitUpdateToDoList(List<ToDo> todo_list);
  void emitGetToDoList(List<ToDo> todo_list);
}
