import 'package:core_control_panel/constants/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.formkey,
    required this.isUpdate,
    required this.textController,
    required this.labelName,
  });

  final bool isUpdate;
  final GlobalKey<FormState> formkey;
  final TextEditingController textController;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textController,
            cursorWidth: 1,
            readOnly: isUpdate,
            decoration: InputDecoration(labelText: labelName),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Strings.formValidator;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
