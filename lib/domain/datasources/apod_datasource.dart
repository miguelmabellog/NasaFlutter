import 'package:nasa_flutter/domain/entities/apod.dart';

abstract class ApodDataSource {
  Future<Apod> getPictureDay(String date, bool thumbs);
}
