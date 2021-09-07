import 'package:todo_list/entity/todo_entity.dart';
import 'package:todo_list/gateway/todo_gateway.dart';
import 'package:todo_list/usecase/todo_usecase.dart';


class ToDoInteractor implements ToDoInputPort {
  ToDoGateway tdg;
  ToDoOutputPort op;
  ToDoInteractor(this.tdg, this.op);

  void handleDeleteToDo(int index) {
    print('interactor');
    List<ToDo> rsl = this.tdg.deleteToDoList(index);
    this.op.emitDeleteToDoList(rsl);
  }

  void handleUpdateToDo(String title, String? memo) {
    print('interactor');
    List<ToDo> rsl = this.tdg.updateToDoList(title, memo);
    this.op.emitUpdateToDoList(rsl);
  }

  void handleGetToDo() {
    List<ToDo> rsl = this.tdg.getToDoList();
    this.op.emitGetToDoList(rsl);
  }
}
