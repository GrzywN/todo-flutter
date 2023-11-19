import 'package:todo_list/common.dart';
import 'package:todo_list/common/toast/toast_helper.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';
import 'package:todo_list/features/todo/domain/entities/todo.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class TodoTitleText extends StatelessWidget {
  final TodoEntity todo;

  const TodoTitleText({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Linkify(
      text: todo.title ?? "Lorem Ipsum",
      onOpen: (link) async {
        if (!await launchUrl(
          Uri.parse(link.url),
          mode: LaunchMode.externalApplication,
        )) {
          ToastHelper.error(
            context,
            AppLocalizations.of(context)!.errorOccurredMessage,
          );
        }
      },
      style: _buildTextStyle(context),
      linkStyle: _buildLinkStyle(context),
    );
  }

  bool isUsingDarkMode(BuildContext context) {
    final whichMode = Theme.of(context).brightness;
    return whichMode == Brightness.dark;
  }

  TextStyle _buildTextStyle(BuildContext context) {
    final completedColor = isUsingDarkMode(context)
        ? const Color.fromRGBO(255, 255, 255, 0.5)
        : const Color.fromRGBO(0, 0, 0, 0.5);

    return TextStyle(
      fontSize: TypographyToken.fontSizes[FontSizes.large],
      height: TypographyToken.heights[FontSizes.large],
      fontWeight: TypographyToken.weights[Weights.medium],
      color: todo.isCompleted ?? false ? completedColor : null,
      decoration: todo.isCompleted ?? false ? TextDecoration.lineThrough : null,
      decorationColor: completedColor,
      decorationThickness: 2.0,
    );
  }

  TextStyle _buildLinkStyle(BuildContext context) {
    final baseLinkColor = Theme.of(context).colorScheme.primary;
    final completedLinkColor = baseLinkColor.withOpacity(0.5);
    final linkColor =
        todo.isCompleted ?? false ? completedLinkColor : baseLinkColor;

    return _buildTextStyle(context).copyWith(
      color: linkColor,
      decoration: todo.isCompleted ?? false
          ? TextDecoration.lineThrough
          : TextDecoration.underline,
      decorationColor: linkColor,
    );
  }
}
