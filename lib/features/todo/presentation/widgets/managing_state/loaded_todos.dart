import 'package:flutter/material.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/features/todo/presentation/widgets/displaying_data/todo_list.dart';

class LoadedTodos extends StatelessWidget {
  final LocalTodoState state;

  const LoadedTodos({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoList(state: state);
  }
}
