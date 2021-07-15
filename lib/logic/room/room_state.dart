part of 'room_cubit.dart';

class RoomState extends Equatable {
  final Room room;

  RoomState(this.room);

  @override
  List<Object> get props => [room];
}
