part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

class PlaySound extends PlayerEvent{
  final String sound;
  const PlaySound({required this.sound});
  @override
  List<Object?> get props => [sound];
}

class PauseSound extends PlayerEvent{
  const PauseSound();
  @override
  List<Object?> get props => [];
}