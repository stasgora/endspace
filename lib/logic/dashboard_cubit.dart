import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:reloadable_bloc/reloadable_bloc.dart';
import 'package:stateful_bloc/stateful_bloc.dart';

import 'base/stateful_base.dart';

class DashboardCubit extends StatefulBase<DashboardData> {
  DashboardCubit(ModalRoute route) : super(route);

  @override
  Future reload(ReloadableReason reason) => load(body: () async {
    var data = await connection.request('planetData');
    return Action.finish(DashboardData.fromJson(data));
  });
}

class DashboardData extends Equatable {
  final double energy;
  final String planet;
  final int endTime;

  DashboardData(this.energy, this.planet, this.endTime);

  DashboardData.fromJson(Map<String, dynamic> json)
      : energy = json['energy'],
        planet = json['planet'],
        endTime = json['endTime'];

  @override
  List<Object> get props => [];
}
