import 'package:flutter/material.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_button/custom_button.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final Story customButtonStory = Story(
  name: 'Atoms/CustomButton',
  description: 'Button reusable based on FilledButton.',
  builder: (context) {
    final label = context.knobs.text(label: 'Texto', initial: 'Press me');
    final enabled = context.knobs.boolean(label: 'Enabled', initial: true);

    return Center(
      child: CustomButton(
        text: label,
        onPressed: enabled ? () => debugPrint('Button pressed') : null,
      ),
    );
  },
);
