import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_flutter/core/ui/atoms/atoms.dart';
import 'package:nasa_flutter/presentation/screens/picture_day_screen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  void goToPictureDayScreen(BuildContext context) {
    context.push(PictureDayImage.pictureDayPath);
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
      ],
    );
  }
}
