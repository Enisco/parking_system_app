// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_system_app/image_string_bloc.dart';

import 'backgroundimage_string_bloc.dart';

Color darkblue = const Color.fromARGB(255, 18, 32, 56);
String combinedParkedStateValue = '000';

class PackingSystemAppTwo extends StatefulWidget {
  const PackingSystemAppTwo({Key? key}) : super(key: key);

  @override
  State<PackingSystemAppTwo> createState() => _PackingSystemAppTwoState();
}

class _PackingSystemAppTwoState extends State<PackingSystemAppTwo> {
  int imageNum = 1;
  String backgroundImageString = 'images/futa1.jpg';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (backgroundImageString == 'images/futa1.jpg') BackgroundImage2();
        if (backgroundImageString == 'images/futa2.jpg') BackgroundImage3();
        if (backgroundImageString == 'images/futa3.jpg') BackgroundImage1();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ParkingStateImageStringBloc, String>(
        builder: (context, state) {
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
                image: AssetImage(backgroundImageString),
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
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
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
    });
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
          ParkStateChangeButton(
            containerColor: Colors.red,
            numIndexString: '000',
          ),
          //-----------------------------------------------
          ParkStateChangeButton(
            containerColor: Colors.blue,
            numIndexString: '001',
          ),
          //-----------------------------------------------

          ParkStateChangeButton(
            containerColor: Colors.green,
            numIndexString: '100',
          )
          //-----------------------------------------------
        ],
      ),
    );
  }
}

class ParkStateChangeButton extends StatelessWidget {
  ParkStateChangeButton(
      {required this.numIndexString, required this.containerColor, Key? key})
      : super(key: key);

  String numIndexString = '000';
  Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor,
      child: TextButton(
        onPressed: () {},
        child: Text(
          numIndexString,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
