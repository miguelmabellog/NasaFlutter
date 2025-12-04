import 'package:flutter_riverpod/legacy.dart';
import 'package:nasa_flutter/domain/entities/near_earth_object_response.dart';
import 'package:nasa_flutter/infrastructure/models/near_earth_result.dart';
import 'package:nasa_flutter/infrastructure/models/result.dart';
import 'package:nasa_flutter/presentation/providers/apod_repository_provider.dart';

final nearEarthObjectsByDatesProvider =
    StateNotifierProvider<
      NearEarthObjectsByDatesNotifier,
      NearEarthObjectsResult
    >((ref) {
      final getNearEarthObjects = ref
          .watch(apodRepositoryProvider)
          .getNearEarthObjects;

      return NearEarthObjectsByDatesNotifier(
        getNearEarthObjects: getNearEarthObjects,
      );
    });

typedef GetNearEarthObjectsCallback =
    Future<Result<NearEarthObjectResponse>> Function(
      String startDate,
      String endDate,
    );

class NearEarthObjectsByDatesNotifier
    extends StateNotifier<NearEarthObjectsResult> {
  final GetNearEarthObjectsCallback getNearEarthObjects;
  bool isLoading = false;

  NearEarthObjectsByDatesNotifier({required this.getNearEarthObjects})
    : super(NearEarthObjectsResult(isLoading: true));

  Future<void> loadNearEarthObjectsByDates(
    String startDate,
    String endDate,
  ) async {
    isLoading = true;

    try {
      final result = await getNearEarthObjects(startDate, endDate);

      result.when(
        success: (nearEarthObjectResponse) {
          state = NearEarthObjectsResult(
            nearEarthObjectResponse: nearEarthObjectResponse,
            isLoading: false,
          );
        },
        failure: (errorMessage) {
          state = NearEarthObjectsResult(
            errorMessage: errorMessage,
            isLoading: false,
          );
        },
      );
    } catch (e) {
      state = NearEarthObjectsResult(
        errorMessage: e.toString(),
        isLoading: false,
      );
    }

    isLoading = false;
  }
}
