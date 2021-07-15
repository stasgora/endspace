part of 'room_cubit.dart';

class RoomState extends Equatable {
  final String code;
  final List<String> players;

  RoomState({required this.code, this.players = const []});

  @override
  List<Object> get props => [code, players];
}
