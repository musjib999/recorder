import 'package:flutter/material.dart';
import 'package:recorder/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/record/record_bloc.dart';

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
          RoundedButton(
            onPressed: () async {
              context.read<RecordBloc>().add(const PauseRecord());
            },
            color: Colors.blue,
            icon: Icons.pause,
          ),
          RoundedButton(
            color: Colors.green,
            onPressed: () async {
              context.read<RecordBloc>().add(const StopRecord());
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
            },
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}
