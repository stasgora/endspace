import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/timer/timer_cubit.dart';
import '../utils/duration_utils.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Text(
          formatDuration(Duration(seconds: state.value)),
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }
}
