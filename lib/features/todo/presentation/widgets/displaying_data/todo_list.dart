import 'package:todo_list/common.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';
import 'package:todo_list/features/todo/presentation/widgets/interactive_widgets/dismissible_todo.dart';

class TodoList extends StatelessWidget {
  final LocalTodoState state;

  const TodoList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingToken.screenHorizontalPadding,
      ),
      itemBuilder: (context, idx) {
        return DismissibleTodo(
          todo: state.todos![idx],
        );
      },
      itemCount: state.todos!.length,
    );
  }
}
