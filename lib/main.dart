import 'package:flutter/material.dart';
import 'package:recorder/index.dart';
import 'bloc/record/record_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecordBloc(),
      child: MaterialApp(
        title: 'Recorder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Recorder(),
      ),
    );
  }
}
