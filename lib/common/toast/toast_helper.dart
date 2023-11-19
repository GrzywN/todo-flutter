import 'package:todo_list/common.dart';
import 'package:todo_list/common/ui/tokens/typography.dart';

class ToastHelper {
  static void _showToast(BuildContext context, String message,
      {String actionLabel = "", ToastType type = ToastType.info}) {
    final scaffold = ScaffoldMessenger.of(context);

    Color backgroundColor;
    switch (type) {
      case ToastType.success:
        backgroundColor = Colors.green;
        break;
      case ToastType.warning:
        backgroundColor = Colors.orange;
        break;
      case ToastType.error:
        backgroundColor = Colors.red;
        break;
      case ToastType.info:
      default:
        backgroundColor = Colors.blue;
        break;
    }

    scaffold.showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: TypographyToken.fontSizes[FontSizes.large],
                height: TypographyToken.heights[FontSizes.large],
                fontWeight: TypographyToken.weights[Weights.medium],
              ),
            )
          ],
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  static void success(BuildContext context, String message) {
    _showToast(
      context,
      message,
      actionLabel: AppLocalizations.of(context)!.successMessage,
      type: ToastType.success,
    );
  }

  static void warning(BuildContext context, String message) {
    _showToast(
      context,
      message,
      actionLabel: AppLocalizations.of(context)!.warningMessage,
      type: ToastType.warning,
    );
  }

  static void error(BuildContext context, String message) {
    _showToast(
      context,
      message,
      actionLabel: AppLocalizations.of(context)!.errorMessage,
      type: ToastType.error,
    );
  }

  static void info(BuildContext context, String message) {
    _showToast(
      context,
      message,
      actionLabel: AppLocalizations.of(context)!.infoMessage,
      type: ToastType.info,
    );
  }
}

enum ToastType { success, warning, error, info }
