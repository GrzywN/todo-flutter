import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/sizes.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:todo_list/features/todo/presentation/bloc/local/local_todo_bloc.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: AppLocalizations.of(context)!.createTodoButton,
      onPressed: () => _showAddTodoDrawer(context),
      child: const Icon(Icons.add),
    );
  }

  void _showAddTodoDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom),
            child: Wrap(
              alignment: WrapAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(SpacingToken.newTodoFormPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextField(
                        maxLines: null,
                        controller: _titleController,
                        style: TextStyle(
                          fontSize: TypographyToken.fontSizes[FontSizes.base],
                          height: TypographyToken.heights[FontSizes.base],
                          fontWeight: TypographyToken.weights[Weights.medium],
                        ),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.newTodoTitle,
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        maxLines: null,
                        controller: _descriptionController,
                        style: TextStyle(
                          fontSize: TypographyToken.fontSizes[FontSizes.small],
                          height: TypographyToken.heights[FontSizes.small],
                          fontWeight: TypographyToken.weights[Weights.regular],
                        ),
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context)!.newTodoDescription,
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: SpacingToken.newTodoFloatingButtonPadding,
                      bottom: MediaQuery.of(context).viewInsets.bottom + SpacingToken.newTodoFloatingButtonPadding),
                  child: SizedBox(
                      height: SizesToken.newTodoIconButtonSize,
                      width: SizesToken.newTodoIconButtonSize,
                      child: FloatingActionButton(
                        tooltip: AppLocalizations.of(context)!.createTodoButton,
                        onPressed: () {
                          _onCreateTodo(context);
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.send_rounded),
                      )),
                )
              ],
            ));
      },
    );
  }

  void _onCreateTodo(BuildContext context) {
    final localTodoBloc = BlocProvider.of<LocalTodoBloc>(context);
    final newTodo = TodoEntity(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    localTodoBloc.add(AddTodo(newTodo));

    _titleController.clear();
    _descriptionController.clear();
  }
}
