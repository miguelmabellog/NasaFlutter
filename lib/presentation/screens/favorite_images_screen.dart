import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/presentation/providers/storage/favorite_apod_provider.dart';
import 'package:nasa_flutter/shared/widgets/apod_masonry.dart';

class FavoriteImagesScreen extends ConsumerStatefulWidget {
  const FavoriteImagesScreen({super.key});

  static final String favoriteImagesPath = '/favorite_images';
  static final String routeName = 'favorite_images_screen';

  @override
  ConsumerState<FavoriteImagesScreen> createState() =>
      _FavoriteImagesScreenState();
}

class _FavoriteImagesScreenState extends ConsumerState<FavoriteImagesScreen> {
  @override
  void initState() {
    ref.read(favoriteApodProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteApods = ref.watch(favoriteApodProvider);
    final apodList = favoriteApods.values.toList();

    return ApodMasonry(
      apods: apodList,
      loadNextPage: ref.read(favoriteApodProvider.notifier).loadNextPage,
    );
  }
}
