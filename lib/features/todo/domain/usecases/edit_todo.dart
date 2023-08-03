import 'package:todo_list/core/usecase/usecase.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/domain/repository/todo_repository.dart';

class EditTodoUseCase implements UseCase<void, TodoEntity> {
  final TodoRepository _todoRepository;

  EditTodoUseCase(this._todoRepository);

  @override
  Future<void> execute({TodoEntity? params}) {
    return _todoRepository.updateTodo(params!);
  }
}
