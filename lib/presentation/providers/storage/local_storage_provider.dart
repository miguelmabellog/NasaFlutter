import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/infrastructure/datasources/drift_datasource_impl.dart';
import 'package:nasa_flutter/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(DriftDataSourceImpl());
});
