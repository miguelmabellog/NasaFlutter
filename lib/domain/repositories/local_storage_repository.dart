import 'package:nasa_flutter/domain/entities/apod.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavoriteApod(Apod apod);
  Future<bool> isFavoriteApod(String date);
  Future<List<Apod>> loadFavoriteApods({int limit = 15, int offset = 0});
}
