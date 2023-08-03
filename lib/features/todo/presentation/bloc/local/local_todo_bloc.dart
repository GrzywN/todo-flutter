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

  void onAddTodo(AddTodo event, Emitter<LocalTodoState> emit) async {
    await _addTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    emit(LocalTodoDone(todos));
  }

  void onCompleteTodo(CompleteTodo event, Emitter<LocalTodoState> emit) async {
    await _completeTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    emit(LocalTodoDone(todos));
  }

  void onDeleteTodo(DeleteTodo event, Emitter<LocalTodoState> emit) async {
    await _deleteTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    emit(LocalTodoDone(todos));
  }

  void onEditTodo(EditTodo event, Emitter<LocalTodoState> emit) async {
    await _editTodoUseCase(params: event.todo);
    final todos = await _getTodosUseCase();
    emit(LocalTodoDone(todos));
  }

  void onGetTodos(GetTodos event, Emitter<LocalTodoState> emit) async {
    final todos = await _getTodosUseCase();
    emit(LocalTodoDone(todos));
  }
}
