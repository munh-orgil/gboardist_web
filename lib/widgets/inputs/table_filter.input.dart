import 'package:flutter/material.dart';

class InputTableFilter extends StatelessWidget {
  const InputTableFilter({
    super.key,
    required this.controller,
    required this.onFieldSubmitted,
    required this.labelText,
    required this.width,
  });

  final TextEditingController controller;
  final Function(String value) onFieldSubmitted;
  final String labelText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        constraints: BoxConstraints(
          maxHeight: 28,
          maxWidth: width,
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.close_outlined,
            size: 12,
          ),
          onPressed: () {
            controller.text = '';
            onFieldSubmitted('');
          },
        ),
      ),
      cursorHeight: 20,
      style: Theme.of(context).textTheme.bodyMedium,
      onFieldSubmitted: (value) => onFieldSubmitted(value),
    );
  }
}
