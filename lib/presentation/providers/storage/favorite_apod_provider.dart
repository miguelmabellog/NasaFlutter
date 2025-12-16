import 'package:flutter_riverpod/legacy.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/repositories/local_storage_repository.dart';
import 'package:nasa_flutter/presentation/providers/storage/local_storage_provider.dart';

class StorageApodNotifier extends StateNotifier<Map<int, Apod>> {
  int page = 0;

  final LocalStorageRepository localStorageRepository;

  StorageApodNotifier({required this.localStorageRepository}) : super({});

  Future<List<Apod>> loadNextPage() async {
    final apods = await localStorageRepository.loadFavoriteApods(
      limit: 15,
      offset: page * 15,
    );

    page++;

    final tempApods = <int, Apod>{};

    for (final apod in apods) {
      tempApods[apod.date.hashCode] = apod;
    }

    state = {...state, ...tempApods};

    return apods;
  }

  Future<void> toggleFavoriteApod(Apod apod) async {
    final isFavorite = state.containsKey(apod.date.hashCode);
    await localStorageRepository.toggleFavoriteApod(apod);

    if (isFavorite) {
      state.remove(apod.date.hashCode);
      state = {...state};
      return;
    }

    state = {...state, apod.date.hashCode: apod};
  }
}

final favoriteApodProvider =
    StateNotifierProvider<StorageApodNotifier, Map<int, Apod>>((ref) {
      //*** read() is used to get the value of the provider, could be watch() */
      final localStorageRepository = ref.read(localStorageRepositoryProvider);

      return StorageApodNotifier(
        localStorageRepository: localStorageRepository,
      );
    });
