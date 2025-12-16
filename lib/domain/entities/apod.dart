import 'package:nasa_flutter/config/database/database.dart';

class Apod {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String title;
  final String url;

  Apod({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.title,
    required this.url,
  });

  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      copyright: json['copyright'] ?? '',
      date: json['date'],
      explanation: json['explanation'],
      hdurl: json['hdurl'] ?? '',
      mediaType: json['media_type'],
      title: json['title'],
      url: json['url'],
    );
  }

  factory Apod.fromDriftDB(FavoriteApodData row) {
    return Apod(
      copyright: row.copyright,
      date: row.date,
      explanation: row.explanation,
      hdurl: row.hdurl,
      mediaType: row.mediaType,
      title: row.title,
      url: row.url,
    );
  }
}
