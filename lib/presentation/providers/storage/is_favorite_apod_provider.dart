import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/presentation/providers/storage/local_storage_provider.dart';

final isFavoriteApodProvider = FutureProvider.family<bool, String>((
  ref,
  apodDate,
) {
  return AsyncValue.guard(() async {
    final repository = ref.watch(localStorageRepositoryProvider);

    return await repository.isFavoriteApod(apodDate);
  }).then((asyncValue) {
    return asyncValue.when(
      data: (value) => value,
      error: (error, stackTrace) {
        return false;
      },
      loading: () => false,
    );
  });
});
