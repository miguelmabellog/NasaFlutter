import 'package:nasa_flutter/domain/entities/apod.dart';

class ApodResult {
  final Apod? apod;
  final String errorMessage;
  final bool isLoading;

  ApodResult({this.apod, this.errorMessage = "", this.isLoading = false});
}
