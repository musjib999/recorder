part of 'record_bloc.dart';


class RecordState extends Equatable {
  final RecorderStatus status;
  final String? path;
  const RecordState({this.status = RecorderStatus.initial, this.path});

  RecordState copyWith({
    RecorderStatus? status,
    final String? path,
  }){
    return RecordState(status: status ?? this.status, path: path ?? this.path);
  }

  List<Object?> get props => [ status, path ];
}


