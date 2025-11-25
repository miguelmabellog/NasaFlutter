import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';

class NearEarthObjectsResult {
  final NearEarthObjectResponse? nearEarthObjectResponse;
  final String errorMessage;
  final bool isLoading;

  NearEarthObjectsResult({
    this.nearEarthObjectResponse,
    this.errorMessage = "",
    this.isLoading = false,
  });
}
