import 'package:todo_list/common.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';

class TodoList extends StatelessWidget {
  final LocalTodoState state;

  const TodoList({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.screenHorizontalPadding,
      ),
      itemBuilder: (context, idx) {
        return ListTile(
            title: Text(_getTitleFromState(state, idx) ?? "Lorem ipsum"),
            subtitle:
                Text(_getDescriptionFromState(state, idx) ?? "Lorem ipsum"),
            enabled: _getIsCompletedFromState(state, idx) ?? false);
      },
      itemCount: _getTodoLengthFromState(state),
    );
  }

  String? _getTitleFromState(LocalTodoState state, int idx) {
    return state.todos![idx].title;
  }

  String? _getDescriptionFromState(LocalTodoState state, int idx) {
    return state.todos![idx].description;
  }

  bool? _getIsCompletedFromState(LocalTodoState state, int idx) {
    return state.todos![idx].isCompleted;
  }

  int? _getTodoLengthFromState(LocalTodoState state) {
    return state.todos!.length;
  }
}
