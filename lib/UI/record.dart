import 'package:flutter/material.dart';
import 'package:recorder/index.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await recordService.startRecording();
                    },
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await recordService.pauseRecording();
                    },
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await recordService.resumeRecording();
                    },
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await recordService.stopRecording();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
