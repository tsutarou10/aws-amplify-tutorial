import 'package:todo_list/entity/todo_entity.dart';

abstract class ToDoGateway {
  List<ToDo> deleteToDoList(int index);
  List<ToDo> updateToDoList(String title, String? memo);
  List<ToDo> getToDoList();
}
