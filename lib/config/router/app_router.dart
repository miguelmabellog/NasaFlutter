import 'package:go_router/go_router.dart';
import 'package:nasa_flutter/presentation/screens/screens.dart';

const String initialRoute = '/home/0';

final appRouter = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: '/home/:screen',
      name: HomeScreen.routeName,
      builder: (context, state) {
        final int screenIndex = int.parse(
          state.pathParameters['screen'] ?? '0',
        );

        if (screenIndex > 2 || screenIndex < 0) {
          return const HomeScreen();
        }

        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: PictureDayImageScreen.pictureDayPath,
          name: PictureDayImageScreen.routeName,
          builder: (context, state) => PictureDayImageScreen(),
        ),
        GoRoute(
          path: NearEarthObjectsScreen.nearEarthObjectsPath,
          name: NearEarthObjectsScreen.routeName,
          builder: (context, state) => NearEarthObjectsScreen(),
        ),
        GoRoute(
          path: FavoriteImagesScreen.favoriteImagesPath,
          name: FavoriteImagesScreen.routeName,
          builder: (context, state) => FavoriteImagesScreen(),
        ),
      ],
    ),
  ],
);
