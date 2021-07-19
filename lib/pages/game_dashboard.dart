import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateful_bloc/stateful_bloc.dart';

import '../logic/dashboard_cubit.dart';
import '../logic/timer/timer_cubit.dart';
import '../widgets/timer.dart';

class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, StatefulState<DashboardData>>(
        builder: (context, state) {
          if (!state.loaded) return Container();
          var data = state.data!;
          var style = TextStyle(color: Colors.white);
          return Column(
            children: [
              Text('Planet ${data.planet}', style: style),
              Text('Energy ${data.energy}', style: style),
              BlocProvider<TimerCubit>(
                create: (_) => TimerCubit.down(
                  elapsedTime: () {
                    return (data.endTime - DateTime.now().millisecondsSinceEpoch) ~/ 1000;
                  },
                )..startTimer(),
                child: Timer(),
              )
            ],
          );
        },
      ),
    );
  }
}
