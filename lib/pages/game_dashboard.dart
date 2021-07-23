import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/logic/task_cubit.dart';
import 'package:game/model/data/task.dart';

import '../logic/dashboard/dashboard_cubit.dart';
import '../logic/timer/timer_cubit.dart';
import '../widgets/timer.dart';

class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: Colors.white);
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text('Planet ${state.planet}', style: style),
                  Text('Energy ${state.energy}', style: style),
                  BlocProvider<TimerCubit>(
                    create: (_) => TimerCubit.down(
                      elapsedTime: () {
                        var now = DateTime.now().millisecondsSinceEpoch;
                        return (state.endTime - now) ~/ 1000;
                      },
                    )..startTimer(),
                    child: Timer(),
                  ),
                  for (var task in state.tasks.values)
                    ListTile(
                      title: Text('${task.name}', style: style),
                      subtitle: Text(
                        EnumToString.convertToString(task.state),
                        style: style,
                      ),
                      trailing: Text('${task.players}/${task.playersNeeded}', style: style),
                      onTap: () => context.read<TaskCubit>().joinTask(task.id),
                    ),
                ],
              );
            },
          ),
          BlocBuilder<TaskCubit, TaskCubitState>(
            builder: (context, state) {
              var status = state.task?.state;
              if (state.task == null)
                return Container();
              var title = 'Waiting for participants';
              if (status == TaskState.inProgress)
                title = 'Active task: ${state.task!.name}';
              else if (status == TaskState.completed)
                title = 'Finished';
              return Column(
                children: [
                  Text(title, style: style),
                  ElevatedButton(
                    child: Text('Leave'),
                    onPressed: () => context.read<TaskCubit>().leaveTask(),
                  ),
                  if (status == TaskState.inProgress)
                    ElevatedButton(
                      child: Text('Finish'),
                      onPressed: () => context.read<TaskCubit>().action(),
                    ),
                ],
              );
            },
          ),
          ElevatedButton(
            child: Text('Exit'),
            onPressed: () => context.read<DashboardCubit>().exit(),
          ),
        ],
      ),
    );
  }
}
