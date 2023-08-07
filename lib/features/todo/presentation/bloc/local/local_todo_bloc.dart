import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/complete_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/edit_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/get_todos.dart';

part 'local_todo_event.dart';
part 'local_todo_state.dart';

class LocalTodoBloc extends Bloc<LocalTodoEvent, LocalTodoState> {
  final AddTodoUseCase _addTodoUseCase;
  final CompleteTodoUseCase _completeTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final EditTodoUseCase _editTodoUseCase;
  final GetTodosUseCase _getTodosUseCase;

  LocalTodoBloc(this._addTodoUseCase, this._completeTodoUseCase,
      this._deleteTodoUseCase, this._editTodoUseCase, this._getTodosUseCase)
      : super(const LocalTodoLoading()) {
    on<AddTodo>(onAddTodo);
    on<CompleteTodo>(onCompleteTodo);
    on<DeleteTodo>(onDeleteTodo);
    on<EditTodo>(onEditTodo);
    on<GetTodos>(onGetTodos);
  }

  static void _sortByIsCompleted(List<TodoEntity> todos) {
    // TODO: add sorting by other factors like createdAt
    todos.sort((a, b) => a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ?? false ? 1 : -1));
  }

  Future<void> onAddTodo(AddTodo event, Emitter<LocalTodoState> emit) async {
    await _addTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    _sortByIsCompleted(todos);
    emit(LocalTodoDone(todos));
  }

  Future<void> onCompleteTodo(CompleteTodo event, Emitter<LocalTodoState> emit) async {
    await _completeTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    _sortByIsCompleted(todos);
    emit(LocalTodoDone(todos));
  }

  Future<void> onDeleteTodo(DeleteTodo event, Emitter<LocalTodoState> emit) async {
    await _deleteTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    _sortByIsCompleted(todos);
    emit(LocalTodoDone(todos));
  }

  Future<void> onEditTodo(EditTodo event, Emitter<LocalTodoState> emit) async {
    await _editTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    _sortByIsCompleted(todos);
    emit(LocalTodoDone(todos));
  }

  Future<void> onGetTodos(GetTodos event, Emitter<LocalTodoState> emit) async {
    final todos = await _getTodosUseCase();
    _sortByIsCompleted(todos);
    emit(LocalTodoDone(todos));
  }
}
