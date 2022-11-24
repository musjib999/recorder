import 'package:flutter/material.dart';
import 'package:recorder/index.dart';

class Player extends StatelessWidget {
  final String soundPath;
  static Route route({required String soundPath}) => MaterialPageRoute(
    builder: (_) => Player(soundPath: soundPath),
  );
  const Player({Key? key, required this.soundPath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sound = SoundService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await sound.playSound(soundPath);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
