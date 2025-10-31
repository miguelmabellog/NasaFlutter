import 'package:flutter/material.dart';
import 'package:nasa_flutter/presentation/storybook/decorators/theme_decorator.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_text/custom_text.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story customTextStory = Story(
  name: 'Atoms/CustomText',
  description: 'Text reusable based on Text widget with custom styles',
  builder: (context) {
    return withAppTheme(
      context,
      Center(
        child: CustomText(
          'Hello world',
          // type: CustomTextType.h2,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  },
);
