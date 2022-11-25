import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recorder/index.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final sound = SoundService();
  PlayerBloc() : super(const PlayerState()) {
    on<PlaySound>(_onPlaySound);
    on<PauseSound>(_onPauseSound);
  }

  void _onPlaySound(PlaySound event, Emitter<PlayerState> emit) async{
    await sound.playSound(event.sound);
    emit(const PlayerState(status: PlayerStatus.playing));
  }

  void _onPauseSound(PauseSound event, Emitter<PlayerState> emit) async{
    await sound.pauseSound();
    emit(const PlayerState(status: PlayerStatus.paused));
  }
}
