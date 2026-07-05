enum AsyncState { notstarted, loading, error, success }


class AsyncData<T> {
  final AsyncState
  state; 
  final T? value;
  final String? error;

  AsyncData.notstarted()
    : state = AsyncState.notstarted,
      value = null,
      error = null;

  AsyncData.loading() : state = AsyncState.loading, value = null, error = null;

  AsyncData.success(this.value) : state = AsyncState.success, error = null;

  AsyncData.error(this.error) : state = AsyncState.error, value = null;
}
