import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';

class TodoDescriptionText extends StatelessWidget {
  final TodoEntity todo;

  const TodoDescriptionText({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.description ?? "",
      style: TextStyle(
        fontSize: TypographyToken.fontSizes[FontSizes.base],
        height: TypographyToken.heights[FontSizes.base],
        fontWeight: TypographyToken.weights[Weights.regular],
        decoration: todo.isCompleted ?? false ? TextDecoration.lineThrough : null,
        decorationColor: const Color.fromRGBO(0, 0, 0, 0.25),
        color: todo.isCompleted ?? false ? const Color.fromRGBO(0, 0, 0, 0.25) : null,
      ),
    );
  }
}