part of 'bluetooth_bloc.dart';

enum BluetoothStatus { initial, loading, success, connected }

extension BluetoothStatusX on BluetoothStatus{
  bool get isInitial => this == BluetoothStatus.initial;
  bool get isLoading => this == BluetoothStatus.loading;
  bool get isSuccess => this == BluetoothStatus.success;
  bool get isConnected => this == BluetoothStatus.connected;
}

class BluetoothState extends Equatable {
  final BluetoothStatus status;
  final List<ScanResult>? bluetoothDevices;
  const BluetoothState({this.status = BluetoothStatus.initial, this.bluetoothDevices});

  BluetoothState copyWith({
    BluetoothStatus? status,
    List<ScanResult>? bluetoothDevices,
  }){
    return BluetoothState(status: status ?? this.status, bluetoothDevices: bluetoothDevices ?? this.bluetoothDevices);
  }

  List<Object?> get props => [ status, bluetoothDevices ];
}

