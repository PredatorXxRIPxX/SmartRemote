import 'package:flutter/material.dart';
import 'package:smartcontroller/controllers/bluetoothData.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});
  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    BluetoothData bluetoothData = Provider.of<BluetoothData>(context);

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              "Smart controller",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.extracteurswitch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('extracteur', val ? 1 : 0);
              },
              title: const Text("Extracteur"),
              secondary: const Icon(Icons.water_damage),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.pompe1switch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('pompe1', val ? 1 : 0);
              },
              title: const Text("Pompe1"),
              secondary: const Icon(Icons.energy_savings_leaf_outlined),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.pompe2switch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('pompe2', val ? 1 : 0);
              },
              title: const Text("Pompe2"),
              secondary: const Icon(Icons.energy_savings_leaf_outlined),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.pompe3switch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('pompe3', val ? 1 : 0);
              },
              title: const Text("Pompe3"),
              secondary: const Icon(Icons.energy_savings_leaf_outlined),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.pompe4switch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('pompe4', val ? 1 : 0);
              },
              title: const Text("Pompe4"),
              secondary: const Icon(Icons.energy_savings_leaf_outlined),
            ),
          ),
          Selector<BluetoothData, int>(
            selector: (context, data) => data.pompe5switch,
            builder: (context, value, child) => SwitchListTile(
              value: value == 1,
              onChanged: (bool val) {
                bluetoothData.changeSwitchValue('pompe5', val ? 1 : 0);
              },
              title: const Text("Pompe5"),
              secondary: const Icon(Icons.energy_savings_leaf_outlined),
            ),
          ),
        ],
      ),
    );
  }
}