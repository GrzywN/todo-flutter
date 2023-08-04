import 'package:flutter/material.dart';

class NoTodosAreLoaded extends StatelessWidget {
  const NoTodosAreLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("There are no todos yet!"));
  }
}
