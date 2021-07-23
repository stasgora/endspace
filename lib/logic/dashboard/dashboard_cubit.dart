import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import '../../model/data/task.dart';

import '../cubit_base.dart';

part 'dashboard_state.dart';

class DashboardCubit extends CubitBase<DashboardState> {
  DashboardCubit({required ModalRoute route, required DashboardState state})
      : super(route: route, initialState: state) {
    addCallbacks({
      'dashboardChange': _onDashboardChange,
      'taskChange': _onTaskChange,
    });
  }

  void _onTaskChange(dynamic args) {
    var tasks = Map<int, Task>.from(state.tasks);
    tasks[args['id']] = Task.fromJson(args);
    emit(state.copyWith(tasks: tasks));
  }

  void exit() {
    connection.send('leaveRoom');
    navigator?.pushNamedAndRemoveUntil('/start-page', (route) => false);
  }

  void _onDashboardChange(dynamic data) => emit(state.copyFrom(data));
}
