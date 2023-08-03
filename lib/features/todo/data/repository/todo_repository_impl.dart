import 'package:todo_list/features/todo/data/data_sources/local/app_database.dart';
import 'package:todo_list/features/todo/data/models/todo.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final AppDatabase _appDatabase;

  TodoRepositoryImpl(this._appDatabase);

  @override
  Future<void> addTodo(TodoEntity todo) {
    return _appDatabase.todoDAO.insertTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(TodoEntity todo) {
    return _appDatabase.todoDAO.deleteTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    return _appDatabase.todoDAO.getAllTodos();
  }

  @override
  Future<void> updateTodo(TodoEntity todo) {
    return _appDatabase.todoDAO.updateTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> completeTodo(TodoEntity todo) {
    return _appDatabase.todoDAO.updateTodo(CompletedTodoModel.fromEntity(todo));
  }
}
