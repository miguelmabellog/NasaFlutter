import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/presentation/providers/storage/local_storage_provider.dart';

final isFavoriteApodProvider = FutureProvider.family<bool, String>((
  ref,
  date,
) async {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return await localStorageRepository.isFavoriteApod(date);
});
