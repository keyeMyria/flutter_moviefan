enum Status {
  NOT_STARTED,
  LOADING,
  SUCCESS,
  FAILURE
}

class ActionStatus {
  const ActionStatus({
    this.status = Status.NOT_STARTED,
    this.error,
  });

  final Status status;
  final String error;
}
