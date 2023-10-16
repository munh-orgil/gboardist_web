import 'package:flutter/material.dart';

class Notice {
  final BuildContext context;
  const Notice(this.context);

  show(Widget content, {String? actionLabel, Function? action}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: () {
            action;
          },
        ),
      ),
    );
  }

  warning(String text, {String? actionLabel, Function? action}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.warning_outlined, size: 24, color: Colors.yellow),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
            ),
          ],
        ),
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: () {
            action;
          },
        ),
      ),
    );
  }

  error(String text, {String? actionLabel, Function? action}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.error_outlined, size: 24, color: Colors.redAccent),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
            ),
          ],
        ),
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: () {
            action;
          },
        ),
      ),
    );
  }

  info(String text, {String? actionLabel, Function? action}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.info_outlined, size: 24, color: Colors.blue),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
            ),
          ],
        ),
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: () {
            action;
          },
        ),
      ),
    );
  }

  success(String text, {String? actionLabel, Function? action}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.check_outlined, size: 24, color: Colors.lime),
            const SizedBox(
              width: 16,
            ),
            Text(
              text,
            ),
          ],
        ),
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: () {
            action;
          },
        ),
      ),
    );
  }
}
