import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/usecase/todo_usecase.dart';

class ToDoController {
  ToDoInputPort ip;

  ToDoController(this.ip);

  void deleteToDoController(int index) {
    print('controller');
    return ip.handleDeleteToDo(index);
  }

  void updateToDoController(String title, String? memo) {
    print('controller');
    return ip.handleUpdateToDo(title, memo);
  }

  void getToDoController() {
    print('controller');
    return ip.handleGetToDo();
  }
}
