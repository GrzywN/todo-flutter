import 'package:todo_list/core/usecase/usecase.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/domain/repository/todo_repository.dart';

class GetTodosUseCase implements UseCase<List<TodoEntity>, void> {
  final TodoRepository _todoRepository;

  GetTodosUseCase(this._todoRepository);

  @override
  Future<List<TodoEntity>> call({void params}) {
    return _todoRepository.getTodos();
  }
}
