import 'package:flutter/material.dart';
import 'package:todo_list/features/todo/presentation/widgets/create_todo_button.dart';
import 'package:todo_list/features/todo/presentation/widgets/todos_appbar.dart';
import 'package:todo_list/features/todo/presentation/widgets/todos_body.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodosAppbar(),
      body: TodosBody(),
      floatingActionButton: CreateTodoButton(),
    );
  }
}
