import 'package:nasa_flutter/config/constants/environment.dart';
import 'package:nasa_flutter/config/dio_config.dart';
import 'package:nasa_flutter/core/errors/exceptions.dart';
import 'package:nasa_flutter/domain/datasources/apod_datasource.dart';
import 'package:dio/dio.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/entities/error_response.dart';
import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';

const String apodUrl = "/planetary/apod";
const String feedUrl = "/neo/rest/v1/feed";

class ApodDataSourceImpl extends ApodDataSource {
  final dio = DioConfig.dio;

  @override
  Future<Apod> getPictureDay(String date) async {
    try {
      final response = await dio.get(
        apodUrl,
        queryParameters: {'api_key': Environment.apiKey, 'date': date},
      );

      return Apod.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        final error = ErrorResponse.fromJson(e.response!.data);

        throw ServerException(message: error.msg, statusCode: error.code);
      }

      throw ServerException(
        message: e.response?.data?.toString() ?? e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<NearEarthObjectResponse> getNearEarthObjects(
    String startDate,
    String endDate,
  ) async {
    try {
      final response = await dio.get(
        feedUrl,
        queryParameters: {
          'api_key': Environment.apiKey,
          'start_date': startDate,
          'end_date': endDate,
        },
      );

      return NearEarthObjectResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        final error = ErrorResponse.fromJson(e.response!.data);

        throw ServerException(message: error.msg, statusCode: error.code);
      }

      throw ServerException(
        message: e.response?.data?.toString() ?? e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
