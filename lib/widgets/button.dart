import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        children: [Text(text), Icon(icon)],
      ),
    );
  }
}
