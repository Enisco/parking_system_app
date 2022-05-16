// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:parking_system_app/image_string_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system_app/packing_system_app.dart';

Color darkblue = const Color.fromARGB(255, 18, 32, 56);
// Color darkpurple = Colors.purple.shade800;
String combinedParkedStateValue = '000';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ParkingStateImageStringBloc>(
            create: (BuildContext context) => ParkingStateImageStringBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const PackingSystemApp(),
          // home: const PackingSystemAppTwo(),
        ));
  }
}
