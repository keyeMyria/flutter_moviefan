import 'package:redux/redux.dart';

import '../models/models.dart';
import '../middleware/store_movies_middleware.dart';
import '../reducers/app_state_reducer.dart';

final store = new Store<AppState>(
  appReducer,
  initialState: new AppState(),
  middleware: createStoreMoviesMiddleware(),
);
