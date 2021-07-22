import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../model/task.dart';
import 'base/cubit_base.dart';

class TaskCubit extends CubitBase<TaskCubitState> {
  TaskCubit(ModalRoute route)
      : super(route: route, initialState: TaskCubitState()) {
    addCallbacks({
      'taskChange': _onTaskChange,
    });
  }

  void _onTaskChange(dynamic args) {
    var task = Task.fromJson(args);
    if (state.task == null || state.task!.id != task.id) return;
    emit(TaskCubitState(task));
  }

  void action() {
    if (state.task!.state == TaskState.inProgress)
      connection.send('taskAction', state.task?.id);
    else emit(TaskCubitState());
  }

  void joinTask(int id) async {
    if (state.task != null) return;
    Map<String, dynamic> response = await connection.request('joinTask', id);
    if (response.containsKey('error')) return;
    emit(TaskCubitState(Task.fromJson(response)));
  }
}

class TaskCubitState extends Equatable {
  final Task? task;

  TaskCubitState([this.task]);

  @override
  List<Object?> get props => [task];
}
