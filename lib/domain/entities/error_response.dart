class ErrorResponse {
  final int code;
  final String msg;
  final String serviceVersion;

  ErrorResponse({
    required this.code,
    required this.msg,
    required this.serviceVersion,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'] ?? 0,
      msg: json['msg'] ?? '',
      serviceVersion: json['service_version'] ?? '',
    );
  }
}
