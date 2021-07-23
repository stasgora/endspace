part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final double energy;
  final String planet;
  final int endTime;
  final Map<int, Task> tasks;

  DashboardState({
    required this.energy,
    required this.planet,
    required this.endTime,
    required this.tasks,
  });

  DashboardState copyWith({
    double? energy,
    String? planet,
    int? endTime,
    Map<int, Task>? tasks,
  }) {
    return DashboardState(
      energy: energy ?? this.energy,
      planet: planet ?? this.planet,
      endTime: endTime ?? this.endTime,
      tasks: tasks ?? this.tasks,
    );
  }

  DashboardState copyFrom(Map<String, dynamic> json) {
    return copyWith(
      energy: json['energy'],
      planet: json['planet'],
      endTime: json['endTime'],
      tasks: _mapTasks(json),
    );
  }

  DashboardState.fromJson(Map<String, dynamic> json)
      : energy = json['energy'],
        planet = json['planet'],
        endTime = json['endTime'],
        tasks = _mapTasks(json) ?? {};

  static Map<int, Task>? _mapTasks(dynamic json) => json['tasks'] != null
      ? Map.fromEntries((json['tasks'] as List)
          .map((e) => MapEntry(e['id'], Task.fromJson(e))))
      : null;

  @override
  List<Object> get props => [energy, planet, endTime, tasks];
}
