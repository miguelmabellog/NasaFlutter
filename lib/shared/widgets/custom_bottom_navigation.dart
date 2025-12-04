import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      onTap: (index) => onTabTapped(index),
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Picture'),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust_rounded),
          label: 'Objects',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Images'),
      ],
    );
  }
}
