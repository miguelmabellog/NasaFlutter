import 'package:nasa_flutter/domain/entities/apod.dart';

class ApodMapper {
  static Apod castToEntity(Apod apod) {
    return Apod(
      copyright: apod.copyright,
      date: apod.date,
      explanation: apod.explanation,
      hdurl: apod.hdurl,
      mediaType: apod.mediaType,
      title: apod.title,
      url: apod.url,
    );
  }
}
