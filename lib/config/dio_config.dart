import 'package:dio/dio.dart';
import 'package:nasa_flutter/config/constants/environment.dart';

class DioConfig {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
