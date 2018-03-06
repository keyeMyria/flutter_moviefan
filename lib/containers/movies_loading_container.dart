import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';

class MoviesLoadingContainer extends StatelessWidget {
  final ViewModelBuilder<bool> builder;

  MoviesLoadingContainer({ @required this.builder });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.status.status == Status.LOADING,
      builder: builder,
    );
  }
}
