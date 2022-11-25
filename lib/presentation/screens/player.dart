import 'package:flutter/material.dart';
import 'package:recorder/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/player/player_bloc.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.multitrack_audio,
                size: 70,
              ),
              const SizedBox(height: 15.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<PlayerBloc, PlayerState>(
                    builder: (context, state) {
                      if(state.status.isPlaying){
                        return RoundedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            context.read<PlayerBloc>().add(const PauseSound());
                          },
                          icon: Icons.pause,
                        );
                      }
                      else if(state.status.isPaused){
                        return RoundedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            context.read<PlayerBloc>().add(PlaySound(sound: soundPath));
                          },
                          icon: Icons.play_arrow,
                        );
                      }
                      return RoundedButton(
                        color: Colors.blue,
                        onPressed: () async {
                          context.read<PlayerBloc>().add(PlaySound(sound: soundPath));
                        },
                        icon: Icons.pause,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
