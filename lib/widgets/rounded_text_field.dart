import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {

  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onTextChange;

  const RoundedTextField({
    super.key,
    required this.label,
    required this.onTextChange,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      // Jump to the n ext field on press the enter key
      keyboardType: textInputType,
      obscureText: obscureText,
      onChanged: onTextChange,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3),
        ),
      ),
    );
  }
}
