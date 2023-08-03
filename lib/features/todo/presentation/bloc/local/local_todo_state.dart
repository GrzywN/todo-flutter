part of 'local_todo_bloc.dart';

abstract class LocalTodoState extends Equatable {
  final List<TodoEntity>? todos;

  const LocalTodoState({this.todos});

  @override
  List<Object> get props => [todos!];
}

class LocalTodoLoading extends LocalTodoState {
  const LocalTodoLoading();
}

class LocalTodoDone extends LocalTodoState {
  const LocalTodoDone(List<TodoEntity> todos) : super(todos: todos);
}
