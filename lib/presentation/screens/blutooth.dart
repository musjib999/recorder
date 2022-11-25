import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recorder/bloc/bluetooth/bluetooth_bloc.dart';
import 'package:recorder/bloc/record/record_bloc.dart';

class Bluetooth extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const Bluetooth(),
      );
  const Bluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Devices'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: BlocListener<BluetoothBloc, BluetoothState>(
          listener: (context, state) {
            if(state.status.isConnected){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Connected'),
                ),
              );
              context.read<RecordBloc>().add(const StartRecord());
              Navigator.pop(context);
            }
          }, 
        child: BlocBuilder<BluetoothBloc, BluetoothState>(
            builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status.isSuccess) {
            return ListView.builder(
              itemCount: state.bluetoothDevices!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.bluetooth, color: Colors.blue,),
                  title: Text(state.bluetoothDevices![index].device.name),
                  subtitle: Text(state.bluetoothDevices![index].device.type.name),
                  trailing: ElevatedButton(onPressed: (){
                    context.read<BluetoothBloc>().add(ConnectBluetoothDevice(result: state.bluetoothDevices![index]));
                  }, child: const Text('Connect'),
                  ),
                );
              },
            );
          }
          return ListView.builder(
            itemCount: state.bluetoothDevices!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.bluetoothDevices![index].device.name),
              );
            },
          );
        }),
),
      ),
    );
  }
}
