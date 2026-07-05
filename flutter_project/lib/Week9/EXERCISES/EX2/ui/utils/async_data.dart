enum AsyncStatus { notstarted, loading, success, error }

class AsyncData<T> {
  final AsyncStatus status;
  final T? value;
  final String? error;

  bool isError;

  var data;

  bool isLoading;

  AsyncData.success(this.value) : status = AsyncStatus.success, error = null;
  AsyncData.error(this.error) : status = AsyncStatus.error, value = null;

  AsyncData.notstarted()
    : status = AsyncStatus.notstarted,
      error = null,
      value = null;

  AsyncData.loading()
    : status = AsyncStatus.loading,
      error = null,
      value = null;
}
