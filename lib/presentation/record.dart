import 'package:flutter/material.dart';
import 'package:recorder/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/record/record_bloc.dart';

class Recorder extends StatefulWidget {
  const Recorder({Key? key}) : super(key: key);

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  RecordService recordService = RecordService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recorder'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: BlocBuilder<RecordBloc, RecordState>(
          builder: (context, state) {
            print(state.status);
            if(state.status.isRecording){
              return RecordingButtons(recordService: recordService);
            }else if(state.status.isPaused){
              return PauseRecordingButtons(recordService: recordService);
            }else if(state.status.isResumed){
              return RecordingButtons(recordService: recordService);
            }else if(state.status.isStopped){
              return BlocListener<RecordBloc, RecordState>(
                listener: (context, state){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Record Saved')));
                  print(state.status);
                  print(state.status.name);
                  if(state.status == RecorderStatus.stop){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Record Saved')));
                  }
                },
                child: InitialRecordingButtons(recordService: recordService),
              );
            }
            return InitialRecordingButtons(recordService: recordService);
          },
        ),
      ),
    );
  }
}

class InitialRecordingButtons extends StatelessWidget {
  const InitialRecordingButtons({
    Key? key,
    required this.recordService,
  }) : super(key: key);

  final RecordService recordService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedButton(
            color: Colors.red,
            icon: Icons.mic,
            onPressed: () async {
              context.read<RecordBloc>().add(const StartRecord());
            },
          ),
          // RoundedButton(
          //   onPressed: () async {
          //     await recordService.pauseRecording();
          //   },
          //   color: Colors.blue,
          //   icon: Icons.pause,
          // ),
          // RoundedButton(
          //   onPressed: () async {
          //     await recordService.resumeRecording();
          //   },
          //   color: Colors.blue,
          //   icon: Icons.play_arrow,
          // ),
          // RoundedButton(
          //   color: Colors.green,
          //   onPressed: () async {
          //     final path = await recordService.stopRecording();
          //     Navigator.of(context)
          //         .push(Player.route(soundPath: path!),
          //     );
          //   },
          //   icon: Icons.save,
          // ),
        ],
      ),
    );
  }
}

class RecordingButtons extends StatelessWidget {
  const RecordingButtons({
    Key? key,
    required this.recordService,
  }) : super(key: key);

  final RecordService recordService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // RoundedButton(
          //   color: Colors.red,
          //   icon: Icons.mic,
          //   onPressed: () async {
          //     await recordService.startRecording();
          //   },
          // ),
          RoundedButton(
            onPressed: () async {
              context.read<RecordBloc>().add(const PauseRecord());
            },
            color: Colors.blue,
            icon: Icons.pause,
          ),
          // RoundedButton(
          //   onPressed: () async {
          //     await recordService.resumeRecording();
          //   },
          //   color: Colors.blue,
          //   icon: Icons.play_arrow,
          // ),
          RoundedButton(
            color: Colors.green,
            onPressed: () async {
              context.read<RecordBloc>().add(const StopRecord());
              // Navigator.of(context).push(Player.route(soundPath: path!),
              // );
            },
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}

class PauseRecordingButtons extends StatelessWidget {
  const PauseRecordingButtons({
    Key? key,
    required this.recordService,
  }) : super(key: key);

  final RecordService recordService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // RoundedButton(
          //   color: Colors.red,
          //   icon: Icons.mic,
          //   onPressed: () async {
          //     await recordService.startRecording();
          //   },
          // ),
          // RoundedButton(
          //   onPressed: () async {
          //     await recordService.pauseRecording();
          //   },
          //   color: Colors.blue,
          //   icon: Icons.pause,
          // ),
          RoundedButton(
            onPressed: () async {
              context.read<RecordBloc>().add(const ResumeRecord());
            },
            color: Colors.blue,
            icon: Icons.play_arrow,
          ),
          RoundedButton(
            color: Colors.green,
            onPressed: () async {
              context.read<RecordBloc>().add(const StopRecord());
              // Navigator.of(context).push(Player.route(soundPath: path!),
              // );
            },
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color,
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
