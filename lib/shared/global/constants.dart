
enum RecorderStatus { initial, recording, pause, resume, stop }

extension RecorderStatusX on RecorderStatus{
  bool get isInitial => this == RecorderStatus.initial;
  bool get isRecording => this == RecorderStatus.recording;
  bool get isPaused => this == RecorderStatus.pause;
  bool get isResumed => this == RecorderStatus.resume;
  bool get isStopped => this == RecorderStatus.stop;
}
