import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';

final statusReducer = combineTypedReducers<ActionStatus>([
  new ReducerBinding<ActionStatus, FetchMoviesStartedAction>(_setStarted),
  new ReducerBinding<ActionStatus, FetchMoviesFailedAction>(_setFailed),
  new ReducerBinding<ActionStatus, FetchMoviesSuccessAction>(_setSuccess),
]);

ActionStatus _setStarted(ActionStatus state, action) {
  return new ActionStatus(status: Status.LOADING);
}

ActionStatus _setFailed(ActionStatus state, action) {
  return new ActionStatus(status: Status.FAILURE, error: action.error);
}

ActionStatus _setSuccess(ActionStatus state, action) {
  return new ActionStatus(status: Status.SUCCESS);
}
