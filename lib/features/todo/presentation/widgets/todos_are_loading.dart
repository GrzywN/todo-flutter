import 'package:flutter/material.dart';

class TodosAreLoading extends StatelessWidget {
  const TodosAreLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
