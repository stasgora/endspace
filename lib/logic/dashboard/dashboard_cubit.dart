import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import '../../model/task.dart';

import '../base/cubit_base.dart';

part 'dashboard_state.dart';

class DashboardCubit extends CubitBase<DashboardState> {
  DashboardCubit({required ModalRoute route, required DashboardState state})
      : super(route: route, initialState: state) {
    addCallbacks({
      'dashboardState': _onDashboardState,
      'taskChange': _onTaskChange,
    });
  }

  void _onTaskChange(dynamic args) {
    var tasks = Map<int, Task>.from(state.tasks);
    tasks[args['id']] = Task.fromJson(args);
    emit(state.copyWith(tasks: tasks));
  }

  void _onDashboardState(dynamic data) => emit(DashboardState.fromJson(data));
}
