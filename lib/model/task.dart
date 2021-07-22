import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

enum TaskType { test }

enum TaskState { available, inProgress, completed, failed }

class Task extends Equatable {
  final int id;
  final TaskType type;
  final String name;
  final int participants;
  final TaskState state;

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = EnumToString.fromString(TaskType.values, json['type'])!,
        state = EnumToString.fromString(TaskState.values, json['state'])!,
        name = json['name'],
        participants = json['participants'];

  @override
  List<Object?> get props => [id, type, state, name, participants];
}
