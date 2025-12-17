import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/config/helpers/utils.dart';
import 'package:nasa_flutter/core/ui/atoms/custom_text/custom_text.dart';
import 'package:nasa_flutter/core/ui/molecules/molecules.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/presentation/providers/apod/apod_by_dates_provider.dart';
import 'package:nasa_flutter/presentation/providers/storage/favorite_apod_provider.dart';
import 'package:nasa_flutter/presentation/providers/storage/is_favorite_apod_provider.dart';

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
    if (apodDate == null) return const Center(child: Text('No date available'));

    return Scaffold(
      body: Stack(
        children: [
          result.apod!.mediaType == "image"
              ? PictureImage(urlImage: result.apod!.url)
              : VideoPlayer(
                  videoUrl: result.apod!.url,
                  caption: result.apod!.title,
                ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black54,
              child: CustomText(result.apod!.title),
            ),
          ),

          _FavoriteIconButton(apodDate: apodDate, apod: result.apod!),
        ],
      ),
    );
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

class _FavoriteIconButton extends ConsumerWidget {
  final String apodDate;
  final Apod apod;

  const _FavoriteIconButton({required this.apodDate, required this.apod});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteAsync = ref.watch(isFavoriteApodProvider(apodDate));

    return Positioned(
      right: 16,
      top: 40,
      child: isFavoriteAsync.when(
        data: (isFavorite) => IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 32,
            color: isFavorite ? Colors.red : Colors.white,
          ),
          onPressed: () async {
            await ref
                .read(favoriteApodProvider.notifier)
                .toggleFavoriteApod(apod);

            ref.invalidate(isFavoriteApodProvider(apodDate));
          },
        ),
        loading: () => const CircularProgressIndicator(strokeWidth: 2),
        error: (_, __) => const Icon(Icons.favorite_border_rounded, size: 32),
      ),
    );
  }
}
