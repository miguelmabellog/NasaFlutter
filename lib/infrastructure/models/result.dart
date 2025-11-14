class Result<T> {
  final T? data;
  final String? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  void when({
    required Function(T data) success,
    required Function(String error) failure,
  }) {
    if (data != null) {
      success(data as T);
    } else {
      failure(error!);
    }
  }
}
