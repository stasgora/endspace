part of 'start_page_cubit.dart';

abstract class StartPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class RoomInitial extends StartPageState {}

class RoomJoined extends StartPageState {
  final Room room;

  RoomJoined(this.room);

  @override
  List<Object> get props => [room];
}
