import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';
import 'date_field.dart';

final dateFieldStories = [
  Story(
    name: 'Molecules/DateField',
    builder: (context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DateField(
          labelText: 'Select a date',
          onDateSelected: (date) {
            debugPrint('Selected: $date');
          },
        ),
      ),
    ),
  ),
];
