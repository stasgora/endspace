import 'package:flutter/widgets.dart';
import 'package:stateful_bloc/stateful_bloc.dart';

import 'cubit_base.dart';

abstract class StatefulBase<Data> extends CubitBase<StatefulState<Data>> with StatefulCubit {
  StatefulBase(ModalRoute route)
      : super(route: route, initialState: StatefulState());
}
