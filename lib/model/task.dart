import 'package:enum_to_string/enum_to_string.dart';

enum TaskType { test }

enum TaskState { available, inProgress, completed, failed }

class Task {
  final int id;
  final TaskType type;
  final int participants;
  TaskState state;

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = EnumToString.fromString(TaskType.values, json['type'])!,
        state = EnumToString.fromString(TaskState.values, json['state'])!,
        participants = json['participants'];
}
