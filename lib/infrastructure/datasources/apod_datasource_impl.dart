import 'package:nasa_flutter/config/constants/environment.dart';
import 'package:nasa_flutter/core/errors/exceptions.dart';
import 'package:nasa_flutter/domain/datasources/apod_datasource.dart';
import 'package:dio/dio.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/entities/error_response.dart';

class ApodDataSourceImpl extends ApodDataSource {
  String getApodUrl() => "/planetary/apod";

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  @override
  Future<Apod> getPictureDay(String date, bool thumbs) async {
    try {
      final response = await dio.get(
        getApodUrl(),
        queryParameters: {
          'api_key': Environment.apiKey,
          'date': date,
          'thumbs': thumbs,
        },
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
}
