import 'package:flutter/material.dart';

enum CustomTextType { h1, h2, h3, h4, h5, h6, body, subtitle, caption }

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextType type;

  // Props del Text original
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const CustomText(
    this.text, {
    super.key,
    this.type = CustomTextType.body,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.decoration,
    this.fontStyle,
  });

  TextStyle _getBaseStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    switch (type) {
      case CustomTextType.h1:
        return textTheme.displayLarge!;
      case CustomTextType.h2:
        return textTheme.displayMedium!;
      case CustomTextType.h3:
        return textTheme.displaySmall!;
      case CustomTextType.h4:
        return textTheme.headlineMedium!;
      case CustomTextType.h5:
        return textTheme.headlineSmall!;
      case CustomTextType.h6:
        return textTheme.titleLarge!;
      case CustomTextType.subtitle:
        return textTheme.titleMedium!;
      case CustomTextType.caption:
        return textTheme.bodySmall!;
      case CustomTextType.body:
        return textTheme.bodyMedium!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = _getBaseStyle(context);

    final effectiveStyle = baseStyle.copyWith(
      fontSize: fontSize ?? baseStyle.fontSize,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      color: color ?? baseStyle.color,
      letterSpacing: letterSpacing ?? baseStyle.letterSpacing,
      decoration: decoration ?? baseStyle.decoration,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
    );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
