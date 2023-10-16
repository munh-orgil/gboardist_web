// ignore_for_file: must_be_immutable

import 'package:core_control_panel/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.obscure,
    this.prefixIcon,
    this.suffix,
    this.border,
    this.bordercolor,
    this.maxHeight,
    this.enabled,
    this.maxWidth,
    this.hintText,
    this.suffixtext,
    this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.contheight,
  });
  final bool? obscure;
  final Icon? prefixIcon;
  final Widget? suffix;
  final bool? border;
  final Color? bordercolor;
  final TextEditingController controller;
  final String? label;
  final double? maxHeight;
  final bool? enabled;
  final double? maxWidth;
  final String? hintText;
  final String? suffixtext;
  final Function? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final double? contheight;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: const TextStyle(
                  color: CColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            : const Text(""),
        const SizedBox(height: 3),
        Container(
          height: widget.contheight ?? 42,
          decoration: BoxDecoration(
            color: CColors.textFieldBackground,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: widget.bordercolor ?? Colors.grey.withOpacity(0.5),
            ),
          ),
          child: TextFormField(
            obscureText: widget.obscure ?? false,
            controller: widget.controller,
            maxLines: widget.maxLines ?? 1,
            maxLength: widget.maxLength ?? 60,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            enabled: widget.enabled ?? true,
            decoration: InputDecoration(
              disabledBorder: widget.border ?? false
                  ? OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          width: 0.4,
                          color: widget.bordercolor ?? CColors.disabledBorder))
                  : null,
              enabledBorder: widget.border ?? false
                  ? OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                          width: 0.4,
                          color: widget.bordercolor ?? CColors.enabledBorder))
                  : null,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffix,
              hintText: widget.hintText ?? '',
              hintStyle: const TextStyle(
                color: CColors.textGrey,
              ),
              counterText: "",
              contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              constraints: BoxConstraints(
                maxHeight: widget.maxHeight == null ? 40 : widget.maxHeight!,
                maxWidth: widget.maxWidth ?? 500,
              ),
              filled: false,
              fillColor: CColors.textFieldBackground,
            ),
            cursorHeight: 20,
            cursorColor: Colors.grey.shade600,
            style: TextStyle(
                color: widget.enabled ?? true ? Colors.black : Colors.grey),
            onChanged: widget.onChanged as void Function(String)?,
          ),
        )
      ],
    );
  }
}
