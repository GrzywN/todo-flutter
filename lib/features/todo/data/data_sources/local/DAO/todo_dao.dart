import 'package:floor/floor.dart';
import 'package:todo_list/core/constants/sql_queries.dart';
import 'package:todo_list/features/todo/data/models/todo.dart';

@dao
abstract class TodoDao {
  @Query(getAllTodosQuery)
  Future<List<TodoModel>> getAllTodos();
  // TODO: Implement getAllTodos with Stream instead of Future

  @insert
  Future<void> insertTodo(TodoModel todo);

  @update
  Future<void> updateTodo(TodoModel todo);

  @delete
  Future<void> deleteTodo(TodoModel todo);
}
