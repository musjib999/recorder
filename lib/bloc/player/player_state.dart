part of 'player_bloc.dart';

enum PlayerStatus { initial, playing, paused }

extension PlayerStatusX on PlayerStatus{
  bool get isInitial => this == PlayerStatus.initial;
  bool get isPlaying => this == PlayerStatus.playing;
  bool get isPaused => this == PlayerStatus.paused;
}

class PlayerState extends Equatable {
  final PlayerStatus status;
  const PlayerState({this.status = PlayerStatus.initial});

  PlayerState copyWith({
    PlayerStatus? status,
  }){
    return PlayerState(status: status ?? this.status);
  }

  List<Object?> get props => [ status ];
}