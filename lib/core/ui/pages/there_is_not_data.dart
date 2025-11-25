import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';

class ThereIsNotData extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? buttonTitle;
  final VoidCallback? onButtonPressed;
  const ThereIsNotData({
    super.key,
    this.title,
    this.subtitle,
    this.buttonTitle,
    this.onButtonPressed,
  });

  String _onButtonTitle() {
    if (onButtonPressed == null) {
      return 'Go back';
    }

    return buttonTitle ?? 'Try again';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.amber),
              CustomText(title ?? 'No data found', fontSize: 16),
              CustomButton(
                onPressed: onButtonPressed ?? () => context.pop(),
                text: _onButtonTitle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
