import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothData with ChangeNotifier {
  late BluetoothConnection connection;
  String temperature = "15.0";
  String humidity = "50.0";
  String pompe3 = "20.0";
  String pompe4 = "18.0";
  String pompe5 = "12.0";
  String cps = "15.0";
  String capteur_water = "50.0";

  String get _temperature => temperature;
  String get _humidity => humidity;
  String get _pompe3 => pompe3;
  String get _pompe4 => pompe4;
  String get _pompe5 => pompe5;
  String get _cps => cps;
  String get _capteur_water => capteur_water;

  void updateData(String key, String value) {
    
    if (key == 'temperature') {
      temperature = value;
      
    }
    if (key == 'humidite') {
      humidity = value;
      
    }
    if (key == 'pompe3') {
      pompe3 = value;
     
    }
    if (key == 'pompe4') {
      pompe4 = value;
      
    }
    if (key == 'pompe5') {
      pompe5 = value;
      
    }
    if (key == 'cps') {
      cps = value;
     
    }
    if (key == 'capteur_water') {
      capteur_water = value;
      
    }
    notifyListeners();
  }

  void listinigData() async {
    if (connection.isConnected) {
      connection.input!.listen((Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        String trame = ascii.decode(data);
        List<String> trameList = trame.split('|');
        for (String line in trameList) {
          line = line.trim();
          print("line:$line");
          if (line.contains(":")) {
            List<String> keyValues = line.split(':');
            if (keyValues.length == 2) {
              String key = keyValues[0].trim();
              String value = keyValues[1].trim();
              print('key: $key, value: $value');
              updateData(key, value);
            }
          }
        }
      }).onDone(() {
        print('Disconnected by remote request');
        connection.finish();
        notifyListeners();
      });
    }
  }
}
