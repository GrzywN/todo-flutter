import 'package:todo_list/common.dart';

class NoTodosAreLoaded extends StatelessWidget {
  const NoTodosAreLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.noTodosAreLoaded),
    );
  }
}
