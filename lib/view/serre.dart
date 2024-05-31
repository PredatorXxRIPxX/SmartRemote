import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:smartcontroller/components/cardinfo.dart';

class Serre extends StatefulWidget {
  const Serre({super.key});

  @override
  State<Serre> createState() => _SerreState();
}

class _SerreState extends State<Serre> {
  FlutterBluetoothSerial bluetoothSerial = FlutterBluetoothSerial.instance;
  
  void initialiseBluetooth() async {
    await [
      Permission.bluetooth,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location,
    ].request();
  }

  void stabeliseConnection() async {
    if (await bluetoothSerial.isEnabled == false) {
      bluetoothSerial.requestEnable();
    }
  }

  @override
  void initState() {
    initialiseBluetooth();
    stabeliseConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: AppBar(
              title: const Text(
                "Serre",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            )),
        body: Stack(
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Cardinfo(
                          titleCard: "Tempirature",
                          valueCard: "15",
                          iconCard: const Icon(Icons.thermostat)),
                      Cardinfo(
                          titleCard: "Humidité",
                          valueCard: "50",
                          iconCard: const Icon(Icons.water_damage)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/terrain');
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Serre',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Terrain',
            ),
          ],
        ));
  }
}
