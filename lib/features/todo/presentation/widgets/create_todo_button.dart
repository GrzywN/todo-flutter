import 'package:flutter/material.dart';

class CreateTodoButton extends StatelessWidget {
  const CreateTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Create new todo',
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
