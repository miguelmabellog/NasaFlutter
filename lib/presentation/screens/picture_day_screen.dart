import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/config/helpers/utils.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_text/custom_text.dart';
import 'package:nasa_flutter/core/ui/molecules/molecules.dart';
import 'package:nasa_flutter/presentation/providers/apod/apod_by_dates_provider.dart';
import 'package:nasa_flutter/presentation/providers/storage/is_favorie_apod_provider.dart';

class PictureDayImageScreen extends ConsumerStatefulWidget {
  const PictureDayImageScreen({super.key});
  static final String routeName = 'picture_day';
  static final String pictureDayPath = '/picture_day';

  @override
  ConsumerState<PictureDayImageScreen> createState() => _PictureDayImageState();
}

class _PictureDayImageState extends ConsumerState<PictureDayImageScreen> {
  @override
  void initState() {
    super.initState();

    ref
        .read(apodByDatesProvider.notifier)
        .loadApodByDates(Utils.currentDateYYYYMMDD());

    ref
        .read(apodByDatesProvider.notifier)
        .loadApodByDates(Utils.currentDateYYYYMMDD());
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(apodByDatesProvider);

    final apodDate = result.apod?.date;

    if (result.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (result.errorMessage.isNotEmpty) {
      return Center(child: Text(result.errorMessage));
    }

    final isFavoriteAsync = ref.watch(isFavoriteApodProvider(apodDate!));

    return Stack(
      children: [
        Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (result.apod!.mediaType == "image")
              PictureImage(urlImage: result.apod!.url),

            if (result.apod!.mediaType == "video")
              VideoPlayer(
                videoUrl: "https://youtu.be/ZmcU5UY_Pio?list=RDZmcU5UY_Pio",
                // videoUrl: result.apod!.url,
                caption: result.apod!.title,
              ),

            CustomText(result.apod!.title),
          ],
        ),

        Positioned(
          right: 8,
          top: 8,
          child: isFavoriteAsync.when(
            data: (isFavorite) => IconButton(
              icon: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 32,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () => _toggleFavorite(ref, apodDate, isFavorite),
            ),
            loading: () => const CircularProgressIndicator(strokeWidth: 2),
            error: (error, stackTrace) => const Icon(
              Icons.favorite_border_rounded,
              size: 32,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite(WidgetRef ref, String date, bool currentIsFavorite) {
    // ref.read(localStorageRepositoryProvider).toggleFavorite(date, !currentIsFavorite);
    // Refrescar el provider para que se actualice
    ref.invalidate(isFavoriteApodProvider(date));
  }
}

class PictureImage extends StatelessWidget {
  final String urlImage;
  const PictureImage({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: const CircularProgressIndicator(strokeWidth: 2)),
        );
      },
    );
  }
}
