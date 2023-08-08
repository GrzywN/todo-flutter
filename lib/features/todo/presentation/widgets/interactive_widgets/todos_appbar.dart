import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/sizes.dart';
import 'package:todo_list/common/ui/tokens/spacing.dart';

class TodosAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TodosAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(SizesToken.appbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.homeAppbarTitle),
      actions: [
        Container(
          width: SizesToken.appbarIconButtonSize,
          height: SizesToken.appbarIconButtonSize,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              right: SpacingToken.screenHorizontalPadding),
          // child: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
