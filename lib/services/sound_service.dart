import 'package:just_audio/just_audio.dart';

class SoundService{
  final player = AudioPlayer();
  Future<void> playSound(String sound) async{
      await player.setFilePath(sound);
      await player.play();
  }

  Future<void> pauseSound() async {
    await player.pause();
  }
}