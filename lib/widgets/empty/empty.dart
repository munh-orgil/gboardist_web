import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({
    super.key,
    required this.text,
    required this.loading,
  });

  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (loading) {
          return Container(
            width: constraints.maxWidth,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade900,
            padding: const EdgeInsets.all(40),
            child: const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 16 / 2,
                ),
                Text('Ачааллаж байна'),
              ],
            ),
          );
        } else {
          return Container(
            width: constraints.maxWidth,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade900,
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const Icon(
                  Icons.folder_off_outlined,
                  size: 24,
                ),
                const SizedBox(
                  height: 16 / 2,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
