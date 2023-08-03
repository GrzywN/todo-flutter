import 'package:todo_list/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();

  Future<void> addTodo(TodoEntity todo);

  Future<void> updateTodo(TodoEntity todo);

  Future<void> completeTodo(TodoEntity todo);

  Future<void> deleteTodo(TodoEntity todo);
}
