import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/infrastructure/models/result.dart';

abstract class ApodRepository {
  Future<Result<Apod>> getApod(String date, bool thumbs);
}
