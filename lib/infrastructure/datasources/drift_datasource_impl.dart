import 'package:nasa_flutter/config/database/database.dart';
import 'package:nasa_flutter/domain/datasources/local_storage_datasource.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';

class DriftDataSourceImpl implements LocalStorageDataSource {
  final AppDatabase database;

  DriftDataSourceImpl([AppDatabase? databaseToUse])
    : database = databaseToUse ?? db;

  @override
  Future<bool> isFavoriteApod(String date) async {
    final query = database.select(database.favoriteApod)
      ..where((table) {
        return table.date.equals(date);
      });

    return await query.getSingleOrNull().then((value) => value != null);
  }

  @override
  Future<List<Apod>> loadFavoriteApods({int limit = 15, int offset = 0}) async {
    final query = database.select(database.favoriteApod)
      ..limit(limit, offset: offset);

    final favoriteApodsRows = await query.get();

    final apods = favoriteApodsRows
        .map((apod) => Apod.fromDriftDB(apod))
        .toList();

    return apods;
  }

  @override
  Future<void> toggleFavoriteApod(Apod apod) async {
    final isFavorite = await isFavoriteApod(apod.date);

    if (isFavorite) {
      final deleteFavoriteApod = database.delete(database.favoriteApod)
        ..where((table) => table.date.equals(apod.date));

      await deleteFavoriteApod.go();
      return;
    }

    await database
        .into(database.favoriteApod)
        .insert(
          FavoriteApodCompanion.insert(
            copyright: apod.copyright,
            date: apod.date,
            explanation: apod.explanation,
            hdurl: apod.hdurl,
            mediaType: apod.mediaType,
            title: apod.title,
            url: apod.url,
          ),
        );
  }
}
