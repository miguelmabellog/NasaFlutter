import 'package:go_router/go_router.dart';
import 'package:nasa_flutter/presentation/screens/screens.dart';

const String initialRoute = '/';

final appRouter = GoRouter(
  initialLocation: initialRoute,
  routes: [
    GoRoute(
      path: initialRoute,
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: PictureDayImage.pictureDayPath,
          name: PictureDayImage.routeName,
          builder: (context, state) => PictureDayImage(),
        ),
      ],
    ),

    GoRoute(path: '/', redirect: (_, __) => initialRoute),
  ],
);
