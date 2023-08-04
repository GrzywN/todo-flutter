import 'package:todo_list/common.dart';

class CreateTodoButton extends StatelessWidget {
  const CreateTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: AppLocalizations.of(context)!.createTodoButton,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
