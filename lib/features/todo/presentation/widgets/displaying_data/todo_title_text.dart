import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';

class TodoTitleText extends StatelessWidget {
  final TodoEntity todo;

  const TodoTitleText({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.title ?? "Lorem Ipsum",
      style: TextStyle(
        fontSize: TypographyToken.fontSizes[FontSizes.large],
        height: TypographyToken.heights[FontSizes.large],
        fontWeight: TypographyToken.weights[Weights.medium],
        decoration: todo.isCompleted ?? false ? TextDecoration.lineThrough : null,
        decorationColor: const Color.fromRGBO(0, 0, 0, 0.25),
        color: todo.isCompleted ?? false ? const Color.fromRGBO(0, 0, 0, 0.25) : null,
      ),
    );
  }
}