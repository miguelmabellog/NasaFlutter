import 'package:flutter/material.dart';
import 'package:nasa_flutter/presentation/screens/screens.dart';
import 'package:nasa_flutter/shared/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  // final int screenIndex;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageViewController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  void gotoPage(int index) {
    setState(() {
      currentIndex = index;
    });
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nasa Flutter')),
      body: PageView(
        controller: pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PictureDayImageScreen(),
          NearEarthObjectsScreen(goToBack: gotoPage),
          FavoriteImagesScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTabTapped: gotoPage,
      ),
    );
  }
}
