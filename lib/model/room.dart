import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String code;
  final List<String> players;

  Room({required this.code, this.players = const []});

  Room.fromJson(Map<String, dynamic> json) :
    code = json['code'],
    players = json['players'] != null ? List<String>.from(json['players']) : [];

  @override
  List<Object> get props => [code, players];
}
