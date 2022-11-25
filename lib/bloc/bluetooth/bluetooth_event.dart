part of 'bluetooth_bloc.dart';

abstract class BluetoothEvent extends Equatable {
  const BluetoothEvent();
}

class GetBluetoothDevices extends BluetoothEvent{
  @override
  List<Object?> get props => [];
}

class ConnectBluetoothDevice extends BluetoothEvent{
  final ScanResult result;
  const ConnectBluetoothDevice({required this.result});
  @override
  List<Object?> get props => [];
}