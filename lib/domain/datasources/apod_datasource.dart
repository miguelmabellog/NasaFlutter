import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';

abstract class ApodDataSource {
  Future<Apod> getPictureDay(String date);
  Future<NearEarthObjectResponse> getNearEarthObjects(
    String startDate,
    String endDate,
  );
}
