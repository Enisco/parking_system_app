// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:parking_system_app/mqtt/mqtt_emqx_funcs.dart';
import 'package:parking_system_app/packing_system_app.dart';

Color darkblue = const Color.fromARGB(255, 18, 32, 56);
// Color darkpurple = Colors.purple.shade800;
String combinedParkedStateValue = '000';
void main() {
  mqttConnect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PackingSystemApp(),
      // home: const PackingSystemAppTwo(),
    );
  }
}
