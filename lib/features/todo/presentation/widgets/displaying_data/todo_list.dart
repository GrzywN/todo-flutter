import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';

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
        return CheckboxListTile(
          value: state.todos![idx].isCompleted,
          onChanged: (_) {
            final localTodoBloc = BlocProvider.of<LocalTodoBloc>(context);
            final todo = state.todos![idx];

            localTodoBloc.add(CompleteTodo(todo));
          },
          title: Text(
            _getTitleFromState(state, idx) ?? "Lorem ipsum",
            style: TextStyle(
              fontSize: TypographyToken.fontSizes[FontSizes.large],
              height: TypographyToken.heights[FontSizes.large],
              fontWeight: TypographyToken.weights[Weights.medium],
              decoration: _getIsCompletedFromState(state, idx)
                  ? TextDecoration.lineThrough
                  : null,
              decorationColor: const Color.fromRGBO(0, 0, 0, 0.25),
              color: _getIsCompletedFromState(state, idx)
                  ? const Color.fromRGBO(0, 0, 0, 0.25)
                  : null,
            ),
          ),
          subtitle: Text(
            _getDescriptionFromState(state, idx),
            style: TextStyle(
              fontSize: TypographyToken.fontSizes[FontSizes.base],
              height: TypographyToken.heights[FontSizes.base],
              fontWeight: TypographyToken.weights[Weights.regular],
              decoration: _getIsCompletedFromState(state, idx)
                  ? TextDecoration.lineThrough
                  : null,
              decorationColor: const Color.fromRGBO(0, 0, 0, 0.25),
              color: _getIsCompletedFromState(state, idx)
                  ? const Color.fromRGBO(0, 0, 0, 0.25)
                  : null,
            ),
          ),
          checkboxShape: const CircleBorder(),
        );
      },
      itemCount: _getTodoLengthFromState(state),
    );
  }

  String _getTitleFromState(LocalTodoState state, int idx) {
    return state.todos![idx].title ?? "";
  }

  String _getDescriptionFromState(LocalTodoState state, int idx) {
    return state.todos![idx].description ?? "";
  }

  bool _getIsCompletedFromState(LocalTodoState state, int idx) {
    return state.todos![idx].isCompleted ?? false;
  }

  int _getTodoLengthFromState(LocalTodoState state) {
    return state.todos!.length;
  }
}
