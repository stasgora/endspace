import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import '../model/task.dart';

import 'base/cubit_base.dart';

class DashboardCubit extends CubitBase<DashboardState> {
  DashboardCubit({required ModalRoute route, required DashboardState state})
      : super(route: route, initialState: state) {
    addCallbacks({'dashboardState': _onDashboardState});
  }

  void _onDashboardState(dynamic data) => emit(DashboardState.fromJson(data));
}

class DashboardState extends Equatable {
  final double energy;
  final String planet;
  final int endTime;
  final List<Task> tasks;

  DashboardState(this.energy, this.planet, this.endTime, this.tasks);

  DashboardState.fromJson(Map<String, dynamic> json)
      : energy = json['energy'],
        planet = json['planet'],
        endTime = json['endTime'],
        tasks = json['tasks'] != null
            ? (json['tasks'] as List).map((e) => Task.fromJson(e)).toList()
            : [];

  @override
  List<Object> get props => [];
}
