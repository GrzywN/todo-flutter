import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/todo/presentation/widgets/loaded_todos.dart';
import 'package:todo_list/features/todo/presentation/widgets/no_todos_are_loaded.dart';
import 'package:todo_list/features/todo/presentation/widgets/todos_are_loading.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';

class TodosBody extends StatelessWidget {
  const TodosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalTodoBloc, LocalTodoState>(builder: (_, state) {
      if (state is LocalTodoLoading) {
        return const TodosAreLoading();
      }

      if (state is LocalTodoDone && state.todos!.isEmpty) {
        return const NoTodosAreLoaded();
      }

      if (state is LocalTodoDone) {
        return LoadedTodosList(state: state);
      }

      return const SizedBox();
    });
  }
}
