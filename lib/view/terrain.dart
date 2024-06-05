import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smartcontroller/components/mydrawer.dart';
import 'package:smartcontroller/controllers/bluetoothData.dart';
import 'package:smartcontroller/components/cardinfo.dart';

class Terrain extends StatefulWidget {
  const Terrain({super.key});

  @override
  State<Terrain> createState() => _TerrainState();
}

class _TerrainState extends State<Terrain> {
  late BluetoothData bluetoothData;
  @override
  void initState() {
    bluetoothData =
        Provider.of<BluetoothData>(context, listen: false);
    bluetoothData.listinigData();
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
              "Terrain",
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
          Consumer<BluetoothData>(
            builder: (context, value, child) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Cardinfo(
                          titleCard: "cps1",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps2",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps3",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps4",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps5",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps6",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "cps7",
                          valueCard: bluetoothData.cps,
                          iconCard: const Icon(Icons.place_outlined)),
                      Cardinfo(
                          titleCard: "water Level",
                          valueCard: bluetoothData.capteur_water,
                          iconCard: const Icon(Icons.water)),
                      Cardinfo(
                          titleCard: "extracteur",
                          valueCard: bluetoothData.extracteur,
                          iconCard: const Icon(Icons.water)
                      ),
                      Cardinfo(
                          titleCard: "pompe1",
                          valueCard: bluetoothData.pompe1,
                          iconCard:
                              const Icon(Icons.energy_savings_leaf_outlined)),
                      Cardinfo(
                          titleCard: "pompe2",
                          valueCard: bluetoothData.pompe2,
                          iconCard:
                              const Icon(Icons.energy_savings_leaf_outlined)
                      ),
                      Cardinfo(
                          titleCard: "pompe3",
                          valueCard: bluetoothData.pompe3,
                          iconCard:
                              const Icon(Icons.energy_savings_leaf_outlined)),
                      Cardinfo(
                          titleCard: "pompe4",
                          valueCard: bluetoothData.pompe4,
                          iconCard:
                              const Icon(Icons.energy_savings_leaf_outlined)),
                      Cardinfo(
                          titleCard: "pompe5",
                          valueCard: bluetoothData.pompe5,
                          iconCard:
                              const Icon(Icons.energy_savings_leaf_outlined)),
                    ],
                  ));
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
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Serre',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.deepPurple,
            ),
            label: 'Terrain',
          ),
        ],
      ),
    );
  }
}
