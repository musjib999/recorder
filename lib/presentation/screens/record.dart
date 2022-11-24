import 'package:flutter/material.dart';
import 'package:recorder/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/record/record_bloc.dart';

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
            if(state.status.isRecording){
              return RecordingButtons(recordService: recordService);
            }else if(state.status.isPaused){
              return PauseRecordingButtons(recordService: recordService);
            }else if(state.status.isResumed){
              return RecordingButtons(recordService: recordService);
            }else if(state.status.isStopped){
              return BlocListener<RecordBloc, RecordState>(
                listener: (context, state){
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

