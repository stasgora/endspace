import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/dashboard_cubit.dart';
import '../logic/timer/timer_cubit.dart';
import '../widgets/timer.dart';

class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          var style = TextStyle(color: Colors.white);
          return Column(
            children: [
              Text('Planet ${state.planet}', style: style),
              Text('Energy ${state.energy}', style: style),
              BlocProvider<TimerCubit>(
                create: (_) => TimerCubit.down(
                  elapsedTime: () {
                    return (state.endTime - DateTime.now().millisecondsSinceEpoch) ~/ 1000;
                  },
                )..startTimer(),
                child: Timer(),
              ),
              for (var task in state.tasks)
                Text('${task.id}', style: style),
            ],
          );
        },
      ),
    );
  }
}
