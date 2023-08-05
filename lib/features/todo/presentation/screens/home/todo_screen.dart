import 'package:flutter/material.dart';
import 'package:todo_list/features/todo/presentation/widgets/interactive_widgets/new_todo.dart';
import 'package:todo_list/features/todo/presentation/widgets/interactive_widgets/todos_appbar.dart';
import 'package:todo_list/features/todo/presentation/widgets/managing_state/todos_body.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodosAppbar(),
      body: TodosBody(),
      floatingActionButton: NewTodo(),
    );
  }
}
