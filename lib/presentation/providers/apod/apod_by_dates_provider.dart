import 'package:flutter_riverpod/legacy.dart';
import 'package:nasa_flutter/domain/entities/apod.dart';
import 'package:nasa_flutter/infrastructure/models/apod_result.dart';
import 'package:nasa_flutter/infrastructure/models/result.dart';
import 'package:nasa_flutter/presentation/providers/apod/apod_repository_provider.dart';

final apodByDatesProvider =
    StateNotifierProvider<ApodByDatesNotifier, ApodResult>((ref) {
      final getApod = ref.watch(apodRepositoryProvider).getApod;

      return ApodByDatesNotifier(getApod: getApod);
    });

typedef GetApodCallback =
    Future<Result<Apod>> Function(String date, bool thumbs);

class ApodByDatesNotifier extends StateNotifier<ApodResult> {
  bool isLoading = false;
  final GetApodCallback getApod;

  ApodByDatesNotifier({required this.getApod})
    : super(ApodResult(isLoading: true));

  Future<void> loadApodByDates(String date, bool thumbs) async {
    if (isLoading) return;
    isLoading = true;

    final result = await getApod(date, thumbs);

    result.when(
      success: (apod) {
        state = ApodResult(apod: apod, isLoading: false);
      },
      failure: (errorMessage) {
        state = ApodResult(errorMessage: errorMessage, isLoading: false);
        isLoading = false;
      },
    );

    isLoading = false;
  }
}
