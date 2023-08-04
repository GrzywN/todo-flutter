import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/config/theme/app_theme.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/features/todo/presentation/screens/home/todo_screen.dart';
import 'package:todo_list/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalTodoBloc>(
        create: (context) => sl()..add(const GetTodos()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const TodoScreen(),
        ));
  }
}
