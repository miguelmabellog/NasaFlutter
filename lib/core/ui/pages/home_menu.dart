import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_flutter/config/router/app_router.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';
import 'package:nasa_flutter/presentation/screens/screens.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  void goToPictureDayScreen(BuildContext context) {
    context.push('$initialRoute${PictureDayImageScreen.pictureDayPath}');
  }

  void goToNearEarthObjectsScreen(BuildContext context) {
    context.push('$initialRoute${NearEarthObjectsScreen.nearEarthObjectsPath}');
  }

  void goToFavoriteImagesScreen(BuildContext context) {
    context.push('$initialRoute${FavoriteImagesScreen.favoriteImagesPath}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          text: "Picture Day",
          onPressed: () => goToPictureDayScreen(context),
        ),
        CustomButton(
          text: "Near Earth Objects",
          onPressed: () => goToNearEarthObjectsScreen(context),
        ),
        CustomButton(
          text: "Favorites Images",
          onPressed: () => goToFavoriteImagesScreen(context),
        ),
      ],
    );
  }
}
