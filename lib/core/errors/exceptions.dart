class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({this.message = 'Server error', this.statusCode});

  @override
  String toString() => 'ServerException: $message (code: $statusCode)';
}
