import 'package:flutter/widgets.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:smartcontroller/components/mydrawer.dart';
import 'package:smartcontroller/controllers/bluetoothData.dart';
import 'package:provider/provider.dart';
import 'package:smartcontroller/components/cardinfo.dart';
import 'package:smartcontroller/controllers/bluetoothData.dart';

class Serre extends StatefulWidget {
  const Serre({super.key});

  @override
  State<Serre> createState() => _SerreState();
}

class _SerreState extends State<Serre> {
  FlutterBluetoothSerial bluetoothSerial = FlutterBluetoothSerial.instance;
  late BluetoothConnection connection;
  late BluetoothData bluetoothData;
  List<BluetoothDevice> devices = [];

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
      var response = await bluetoothSerial.requestEnable();
      if (response == true) {
        print("getting bounded devices");
        devices = await bluetoothSerial.getBondedDevices();
      } else {
        bluetoothSerial.openSettings();
      }
    }
  }

  @override
  void initState() {
    bluetoothData = Provider.of<BluetoothData>(context, listen: false);
    initialiseBluetooth();
    stabeliseConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bluetoothData = Provider.of<BluetoothData>(context);
    return Scaffold(
        drawer: const Mydrawer(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              title: const Text(
                "Serre",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
                              height: 400,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                  Expanded(
                                    child: StreamBuilder<List<BluetoothDevice>>(
                                        stream: Stream.periodic(
                                                const Duration(seconds: 1))
                                            .asyncMap((event) => bluetoothSerial
                                                .getBondedDevices()),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return const Center(
                                                child: Text(
                                              "Connected to device",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ));
                                          }

                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          if (snapshot.hasData &&
                                              snapshot.data!.isNotEmpty) {
                                            return ListView.builder(
                                                itemCount: devices.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    title: Text(devices[index]
                                                        .name
                                                        .toString()),
                                                    subtitle: Text(
                                                        devices[index]
                                                            .address
                                                            .toString()),
                                                    leading: const Icon(
                                                        Icons.devices),
                                                    trailing: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(Colors
                                                                      .deepPurple),
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      Colors
                                                                          .white)),
                                                      onPressed: () async {
                                                        try {
                                                          connection =
                                                              await BluetoothConnection
                                                                  .toAddress(devices[
                                                                          index]
                                                                      .address
                                                                      .toString());
                                                          bluetoothData
                                                                  .connection =
                                                              connection;
                                                          bluetoothData
                                                              .listinigData();
                                                          bluetoothData
                                                              .notifyListeners();
                                                          Navigator.pop(
                                                              context);
                                                        } catch (e) {
                                                          print(
                                                              "failed to connect to device");
                                                        }
                                                      },
                                                      child: const Icon(
                                                          Icons.bluetooth),
                                                    ),
                                                  );
                                                });
                                          } else {
                                            return const Center(
                                              child: Text(
                                                "No devices found",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            );
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
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
            Consumer<BluetoothData>(
              builder: (context, value, child) {
                return Padding(
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
                              titleCard: "Temperature",
                              valueCard: value.temperature,
                              iconCard: const Icon(Icons.thermostat)),
                          Cardinfo(
                              titleCard: "Humidité",
                              valueCard: value.humidity,
                              iconCard: const Icon(Icons.water_damage)),
                        ],
                      )
                    ],
                  ),
                );
              },
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
