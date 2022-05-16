// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PackingSystemApp(),
    );
  }
}

class PackingSystemApp extends StatefulWidget {
  const PackingSystemApp({Key? key}) : super(key: key);

  @override
  State<PackingSystemApp> createState() => _PackingSystemAppState();
}

class _PackingSystemAppState extends State<PackingSystemApp> {
  int imageNum = 1;
  String currentBackgroundImage = 'images/futa1.jpg';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        setState(
          () {
            imageNum += 1;
            if (imageNum >= 4) imageNum = 1;
            currentBackgroundImage = 'images/futa$imageNum.jpg';
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 0.0,
        title: Text(
          'Smart Parking System',
          style: TextStyle(
            fontSize: size.width / 18,
            fontWeight: FontWeight.w500,
            color: darkblue,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: size.height * 0.37,
            width: size.width,
            child: Image(
              image: AssetImage(currentBackgroundImage),
            ),
          ),
          // const HostMinistriesCarousel(),
          //--------------------------------------------------------------------

          Positioned(
            top: size.height / 3.5,
            left: 0,
            height: size.height / 8.5,
            width: size.width,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: darkblue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.directions_car,
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    'Carpark state',
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          //--------------------------------------------------------------------

          Positioned(
            top: size.height / 2.75,
            left: size.width / 4,
            height: size.height / 30,
            width: size.width / 2,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80)),
                color: Colors.white,
              ),
            ),
          ),
          //--------------------------------------------------------------------

          Positioned(
            top: size.height / 2.6,
            left: 0,
            height: size.height / 1.7,
            width: size.width,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
              ),
              child: Image(
                image: AssetImage('images/$combinedParkedStateValue.jpg'),
              ),
            ),
          ),
          //--------------------------------------------------------------------

          Positioned(
            bottom: size.height / 100,
            left: 0,
            height: size.height / 10,
            width: size.width,
            child: const DataSelect(),
          ),
        ],
      ),
    );
  }
}
//------------------------------------------------------------------------------

class DataSelect extends StatefulWidget {
  const DataSelect({Key? key}) : super(key: key);

  @override
  State<DataSelect> createState() => _DataSelectState();
}

class _DataSelectState extends State<DataSelect> {
  String parkedStateValue1 = '0',
      parkedStateValue2 = '0',
      parkedStateValue3 = '0',
      stateText1 = "Available",
      stateText2 = "Available",
      stateText3 = "Available";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: darkblue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                if (parkedStateValue1 == '0') {
                  parkedStateValue1 = '1';
                  stateText1 = "Occupied";
                } else {
                  parkedStateValue1 = '0';
                  stateText1 = "Available";
                }
                combinedParkedStateValue =
                    '$parkedStateValue1$parkedStateValue2$parkedStateValue3';
              });
            },
            child: Text(
              stateText1,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
            ),
          ),
          //-----------------------------------------------

          Container(
            width: 2,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            color: Colors.white,
          ),
          //-----------------------------------------------

          TextButton(
            onPressed: () {
              setState(() {
                if (parkedStateValue2 == '0') {
                  parkedStateValue2 = '1';
                  stateText2 = "Occupied";
                } else {
                  parkedStateValue2 = '0';
                  stateText2 = "Available";
                }
                combinedParkedStateValue =
                    '$parkedStateValue1$parkedStateValue2$parkedStateValue3';
              });
            },
            child: Text(
              stateText2,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 13,
              ),
            ),
          ),
          //-----------------------------------------------

          Container(
            width: 2,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            color: Colors.white,
          ),
          //-----------------------------------------------

          TextButton(
            onPressed: () {
              setState(() {
                if (parkedStateValue3 == '0') {
                  parkedStateValue3 = '1';
                  stateText3 = "Occupied";
                } else {
                  parkedStateValue3 = '0';
                  stateText3 = "Available";
                }
                combinedParkedStateValue =
                    '$parkedStateValue1$parkedStateValue2$parkedStateValue3';
              });
            },
            child: Text(
              stateText3,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            ),
          ),
          //-----------------------------------------------
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        child: Text(
          "Occupied",
        ),
        value: "1"),
    const DropdownMenuItem(
        child: Text(
          "Available",
        ),
        value: "0"),
  ];
  return menuItems;
}
