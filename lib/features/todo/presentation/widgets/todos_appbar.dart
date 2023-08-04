import 'package:flutter/material.dart';
import 'package:todo_list/common/ui/tokens/sizes.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';

class TodosAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TodosAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Todos'),
      actions: [
        Container(
          width: Sizes.appbarIconButtonSize,
          height: Sizes.appbarIconButtonSize,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: Spacing.screenHorizontalPadding),
          child: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
