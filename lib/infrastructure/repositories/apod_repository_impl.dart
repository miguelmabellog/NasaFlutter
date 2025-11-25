import 'package:nasa_flutter/core/errors/exceptions.dart';
import 'package:nasa_flutter/domain/datasources/apod_datasource.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';
import 'package:nasa_flutter/domain/repositories/apod_repository.dart';
import 'package:nasa_flutter/infrastructure/models/result.dart';

class ApodRepositoryImpl extends ApodRepository {
  final ApodDataSource _apodDataSource;

  ApodRepositoryImpl(this._apodDataSource);

  @override
  Future<Result<Apod>> getApod(String date) async {
    try {
      final response = await _apodDataSource.getPictureDay(date);

      return Result.success(response);
    } on ServerException catch (e) {
      return Result.failure(e.message);
    }
  }

  @override
  Future<Result<NearEarthObjectResponse>> getNearEarthObjects(
    String startDate,
    String endDate,
  ) async {
    try {
      final response = await _apodDataSource.getNearEarthObjects(
        startDate,
        endDate,
      );

      return Result.success(response);
    } on ServerException catch (e) {
      return Result.failure(e.message);
    }
  }
}
