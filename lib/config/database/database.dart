import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class FavoriteApod extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get copyright => text()();
  TextColumn get date => text()();
  TextColumn get explanation => text()();
  TextColumn get hdurl => text()();
  TextColumn get mediaType => text()();
  TextColumn get title => text()();
  TextColumn get url => text()();

  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

@DriftDatabase(tables: [FavoriteApod])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

final db = AppDatabase();
