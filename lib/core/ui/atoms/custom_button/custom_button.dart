import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CustomButton({super.key, this.onPressed, this.text = 'Button'});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onPressed, child: Text(text));
  }
}
