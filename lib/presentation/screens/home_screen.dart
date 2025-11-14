import 'package:flutter/material.dart';
import 'package:nasa_flutter/core/ui/pages/pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final String routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nasa Flutter')),
      body: const Center(child: HomeMenu()),
    );
  }
}
