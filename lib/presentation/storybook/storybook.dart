import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import '../../core/ui/atoms/atoms.dart';

class AppStorybook extends StatelessWidget {
  const AppStorybook({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [customButtonStory, customTextStory],
      initialStory: 'Atoms/CustomButton',
    );
  }
}
