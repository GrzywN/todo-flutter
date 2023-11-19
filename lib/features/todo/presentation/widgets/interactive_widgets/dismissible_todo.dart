import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';
import 'package:todo_list/features/todo/presentation/widgets/displaying_data/todo_description_text.dart';
import 'package:todo_list/features/todo/presentation/widgets/displaying_data/todo_title_text.dart';

class DismissibleTodo extends StatelessWidget {
  final TodoEntity todo;

  const DismissibleTodo({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<num>(todo.id ?? 0),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        child: const Icon(Icons.edit),
      ),
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
          _onDelete(context, todo);
        } else {
          _onEdit(context, todo);
        }
        return null;
      },
      child: CheckboxListTile(
        value: todo.isCompleted,
        onChanged: (_) {
          final localTodoBloc = BlocProvider.of<LocalTodoBloc>(context);
          localTodoBloc.add(CompleteTodo(todo));
        },
        title: TodoTitleText(todo: todo),
        subtitle: todo.description?.isNotEmpty ?? false
            ? TodoDescriptionText(todo: todo)
            : null,
      ),
    );
  }

  _onEdit(BuildContext context, TodoEntity todo) async {
    if (!context.mounted) return;

    final updatedTodo = await showEditDialog(context, todo);

    if (updatedTodo != null) {
      final localTodoBloc = BlocProvider.of<LocalTodoBloc>(context);
      localTodoBloc.add(EditTodo(updatedTodo));
    }
  }

  _onDelete(BuildContext context, TodoEntity todo) {
    final localTodoBloc = BlocProvider.of<LocalTodoBloc>(context);
    localTodoBloc.add(DeleteTodo(todo));
  }

  Future<TodoEntity?> showEditDialog(
      BuildContext context, TodoEntity todo) async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    titleController.text = todo.title ?? "";
    descriptionController.text = todo.description ?? "";

    return await showDialog<TodoEntity>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.editTodo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.todoTitle),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.todoDescription),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.save),
              onPressed: () {
                final updatedTitle = titleController.text.trim();
                final updatedDescription = descriptionController.text.trim();

                if (updatedTitle.isNotEmpty) {
                  final updatedTodo = TodoEntity(
                    id: todo.id,
                    title: updatedTitle,
                    description: updatedDescription,
                    isCompleted: todo.isCompleted,
                  );
                  Navigator.of(context).pop(updatedTodo);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.emptyTodoNameMessage),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
