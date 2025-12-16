import 'package:nasa_flutter/domain/datasources/local_storage_datasource.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource dataSource;

  LocalStorageRepositoryImpl(this.dataSource);

  @override
  Future<bool> isFavoriteApod(String date) {
    return dataSource.isFavoriteApod(date);
  }

  @override
  Future<List<Apod>> loadFavoriteApods({int limit = 15, int offset = 0}) {
    return dataSource.loadFavoriteApods(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavoriteApod(Apod apod) {
    return dataSource.toggleFavoriteApod(apod);
  }
}
