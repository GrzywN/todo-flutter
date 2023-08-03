import 'package:get_it/get_it.dart';
import 'package:todo_list/features/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_list/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_list/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/complete_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/edit_todo.dart';
import 'package:todo_list/features/todo/domain/usecases/get_todos.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies
  sl.registerSingleton<TodoRepository>(TodoRepositoryImpl(sl()));

  // Use cases
  sl.registerSingleton<AddTodoUseCase>(AddTodoUseCase(sl()));
  sl.registerSingleton<CompleteTodoUseCase>(CompleteTodoUseCase(sl()));
  sl.registerSingleton<DeleteTodoUseCase>(DeleteTodoUseCase(sl()));
  sl.registerSingleton<EditTodoUseCase>(EditTodoUseCase(sl()));
  sl.registerSingleton<GetTodosUseCase>(GetTodosUseCase(sl()));

  // BLoCs
  sl.registerFactory<LocalTodoBloc>(
      () => LocalTodoBloc(sl(), sl(), sl(), sl(), sl()));
}
