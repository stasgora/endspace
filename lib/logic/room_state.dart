part of 'room_cubit.dart';

abstract class RoomState extends Equatable {
  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomJoined extends RoomState {
  final String code;

  RoomJoined(this.code);

  @override
  List<Object> get props => [code];
}
