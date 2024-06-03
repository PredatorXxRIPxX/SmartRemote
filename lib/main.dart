import 'package:flutter/material.dart';
import 'package:smartcontroller/controllers/bluetoothData.dart';
import 'package:smartcontroller/view/serre.dart';
import 'package:smartcontroller/view/terrain.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context)=>BluetoothData() , child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart remote controller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Serre(),
        '/terrain': (context) => const Terrain(),
      },
    );
  }
}
