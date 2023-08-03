part of 'local_todo_bloc.dart';

abstract class LocalTodoEvent extends Equatable {
  final TodoEntity? todo;

  const LocalTodoEvent({this.todo});

  @override
  List<Object> get props => [todo!];
}

class AddTodo extends LocalTodoEvent {
  const AddTodo(TodoEntity todo) : super(todo: todo);
}

class CompleteTodo extends LocalTodoEvent {
  const CompleteTodo(TodoEntity todo) : super(todo: todo);
}

class DeleteTodo extends LocalTodoEvent {
  const DeleteTodo(TodoEntity todo) : super(todo: todo);
}

class EditTodo extends LocalTodoEvent {
  const EditTodo(TodoEntity todo) : super(todo: todo);
}

class GetTodos extends LocalTodoEvent {
  const GetTodos();
}
