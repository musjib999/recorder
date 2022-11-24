part of 'record_bloc.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();
}

class StartRecord extends RecordEvent {
  const StartRecord();
  @override
  List<Object?> get props => [];
}

class PauseRecord extends RecordEvent {
  const PauseRecord();
  @override
  List<Object?> get props => [];
}

class ResumeRecord extends RecordEvent {
  const ResumeRecord();
  @override
  List<Object?> get props => [];
}

class StopRecord extends RecordEvent {
  const StopRecord();
  @override
  List<Object?> get props => [];
}

