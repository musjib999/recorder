import 'package:record/record.dart';

class RecordService {
  final record = Record();
  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      await record.start();
    }
  }

  Future<void> pauseRecording() async {
    if (await record.isRecording()) {
      await record.pause();
    }
  }

  Future<void> resumeRecording() async {
    if (await record.isPaused()) {
      await record.resume();
    }
  }

  Future<String?> stopRecording() async {
    String? path;
    if (await record.isRecording()) {
      path = await record.stop();
    }
    return path;
  }
}
