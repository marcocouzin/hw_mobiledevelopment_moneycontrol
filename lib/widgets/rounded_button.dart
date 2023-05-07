import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function() onPressed;

  // The parameters between {} the caller need to inform the field name
  const RoundedButton({
    super.key, // It's a optional parameter
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonColor = Colors.teal,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(25),
      elevation: 8,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25),
        child: ListTile(
          // onTap: onPressed, // Click function
          leading: icon != null
              ? Icon(
                  icon,
                  color: textColor,
                )
              : null,
          title: Text(
            text,
            textAlign: icon == null ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
