import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_flutter/domain/repositories/apod_repository.dart';
import 'package:nasa_flutter/infrastructure/datasources/apod_datasource_impl.dart';
import 'package:nasa_flutter/infrastructure/repositories/apod_repository_impl.dart';

final apodRepositoryProvider = Provider<ApodRepository>((ref) {
  return ApodRepositoryImpl(ApodDataSourceImpl());
});
