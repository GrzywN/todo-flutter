import 'package:todo_list/core/usecase/usecase.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/domain/repository/todo_repository.dart';

class AddTodoUseCase implements UseCase<void, TodoEntity> {
  final TodoRepository _todoRepository;

  AddTodoUseCase(this._todoRepository);

  @override
  Future<void> call({TodoEntity? params}) {
    return _todoRepository.addTodo(params!);
  }
}
